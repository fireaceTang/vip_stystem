import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/request_model.dart';
import 'event_bus.dart';
import 'public_info.dart';

class Request {
  Dio dio;

  // 工厂模式(dart单例模式)
  factory Request() => _getInstance();

  static Request get instance => _getInstance();
  static Request _instance;

  // 初始化
  Request._internal() {
    dio = new Dio(BaseOptions(
      baseUrl: PublicInfo.serverUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: Headers.formUrlEncodedContentType,
    ));

    // 监听请求事件
    eventBus.on<RequestEvent>().listen((messageEvent) {
      if (messageEvent.responseModel.code != 200) {
        Fluttertoast.showToast(
          msg: messageEvent.responseModel.msg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          textColor: Colors.white,
          fontSize: ScreenUtil.getInstance().setSp(12),
        );
      }
    });
  }

  static Request _getInstance() {
    if (_instance == null) {
      _instance = new Request._internal();
    }
    return _instance;
  }

  setInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
      // 在请求被发送之前做一些事情
      onRequest: (RequestOptions options) async {
        SharedPreferences.getInstance().then((share) {
          String token = share.getString('token');
          print(token);
          if (token != null) {
            options.headers['token'] = token;
          }
        });

        return options;
      },

      // 在返回响应数据之前做一些预处理
      onResponse: (Response response) async {
        return response;
      },

      // 当请求失败时做一些预处理
      onError: (DioError e) async {
        if (e.type == DioErrorType.DEFAULT) {
          if (e.message.indexOf("Connection failed") > -1) {
            eventBus.fire(
                RequestEvent(ResponseModel(code: 400, msg: "连接失败")));
            return e;
          } else if (e.message.indexOf("Connection refused") > -1) {
            eventBus.fire(
                RequestEvent(ResponseModel(code: 400, msg: "连接被拒接")));
            return e;
          } else {
            eventBus.fire(RequestEvent(
                ResponseModel(code: 400, msg: "连接未知错误DEFAULT")));
            return e;
          }
        } else if (e.type == DioErrorType.CONNECT_TIMEOUT) {
          eventBus
              .fire(RequestEvent(ResponseModel(code: 400, msg: "连接超时")));
          return e;
        } else if (e.type == DioErrorType.RESPONSE) {
          if (e.response.statusCode == 401) {
            eventBus.fire(RequestEvent(ResponseModel(
                code: 403, msg: e.response.data["message"])));
            return e;
          } else {
            eventBus.fire(
                RequestEvent(ResponseModel(code: 404, msg: "网络出错")));
            return e;
          }
        } else {
          eventBus.fire(
              RequestEvent(ResponseModel(code: 400, msg: "链接发生未知错误")));
          return e;
        }
      },
    ));
  }

  // post 请求
  Future<ResponseModel> post(String url, {data, cancelToken}) async {
    setInterceptor();

    Response<Map<String, dynamic>> response = await dio.post(
      url,
      data: data,
      cancelToken: cancelToken,
    );
    
    ResponseModel<Map<String, dynamic>> result = ResponseModel.fromJson(response.data);

    eventBus.fire(new RequestEvent(result));

    return result;
  }

  // get 请求
  Future<ResponseModel> get(String url, {data, cancelToken}) async {
    setInterceptor();

    Response<Map<String, dynamic>> response = await dio.get(
        url,
        queryParameters: data,
        cancelToken: cancelToken,
    );

    ResponseModel result = ResponseModel.fromJson(response.data);

    eventBus.fire(new RequestEvent(result));

    return result;
  }

  // 文件上传
  Future<ResponseModel> upload(String url, FormData formData) async {
    setInterceptor();

    Response<Map<String, dynamic>> response = await dio.post(
      url,
      data: formData,
    );

    ResponseModel<List<dynamic>> result = ResponseModel.fromJson(response.data);

    eventBus.fire(new RequestEvent(result));

    return result;
  }
}
