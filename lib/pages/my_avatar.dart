import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vip_system/common/dialog.dart';

import 'package:vip_system/utils/request.dart';
import '../model/request_model.dart';
import '../utils/event_bus.dart';

class MyAvatar extends StatefulWidget {
  MyAvatar({
    Key key,
    @required this.avatar,
  }) : super(key: key);
  final String avatar;

  @override
  MyAvatarState createState() => MyAvatarState(avatar);
}

class MyAvatarState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  TextStyle _textStyle = TextStyle(
    fontSize: ScreenUtil.getInstance().setSp(14),
    color: Color.fromRGBO(51, 51, 51, 1),
  );
  String _avatar;
  File _image;

  Request _request = Request();
  Map _userInfo;
  int _userId;

  // 传参
  MyAvatarState (String avatar) {
    print(avatar);
    _avatar = avatar;
  }

  //拍照
  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      handleData(image);
    }
  }

  // 相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      handleData(image);
    }
  }

  // 调用图片上传
  void handleData(File image) {
    // loading 弹窗
    ProgressDialog.showProgress(context,
      child: SpinKitFadingCircle(
        color: Colors.white,
        duration: Duration(seconds: 10),
      ),
    );
    _imageUpload(image.path).then((result) {
      String _cacheUrl = result.data[0];
      if (result.code == 200) {
        _changeAvatar(_cacheUrl).then((res) {
          if (res.code == 200) {
            setState(() {
              _userInfo['avatar'] = _cacheUrl;
              _share.then((share) {
                share.setString('userInfo', json.encode(_userInfo)).then((r) {
                  eventBus.fire(UpdateInfoEvent());
                  _avatar = _cacheUrl;
                  _image = image;
                  image = null;
                  ProgressDialog.dismiss(context); // 关闭 loading
                });
              });
            });
          }
        });
      }
    });
  }

  // 图片上传
  Future<ResponseModel> _imageUpload (imageUrl) async {
    return await _request.upload(
      '/web/upload/img',
      FormData.fromMap({
        'request': MultipartFile.fromFileSync(imageUrl),
      }),
    );
  }

  // 修改图片
  Future<ResponseModel> _changeAvatar (imageUrl) async {
    return await _request.post(
      '/app/admin/editInfo',
      data: {
        'id': _userId,
        'avatar': imageUrl,
      }
    );
  }

  Future<SharedPreferences> _share = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    _share.then((share) {
      _userInfo = json.decode(share.getString('userInfo'));
      _userId = _userInfo['id'];
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: _textColor,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('个人头像', style: TextStyle(
          color: _textColor,
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Image(
                image: _image != null ? FileImage(_image) : NetworkImage(_avatar != null ? _avatar : ''),
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.getInstance().setHeight(340),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(304),
              height: ScreenUtil.getInstance().setHeight(40),
              margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(61),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(216, 216, 216, 1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5)))
              ),
              child: FlatButton(
                child: Text('从相册选一张', style: _textStyle,),
                onPressed: () {
                  print('1231312');
                  _getImageFromGallery();
                },
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(304),
              height: ScreenUtil.getInstance().setHeight(40),
              margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(22),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(216, 216, 216, 1),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5)))
              ),
              child: FlatButton(
                child: Text('拍一张照片', style: _textStyle,),
                onPressed: () {
                  _getImageFromCamera();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}