import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vip_system/common/dialog.dart';
import 'package:vip_system/utils/event_bus.dart';
import 'dart:convert';

import '../utils/request.dart';
import '../model/request_model.dart';

class PhoneNumber extends StatefulWidget {
  PhoneNumber({
    Key key,
    @required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  PhoneNumberState createState() => PhoneNumberState(phoneNumber);
}

class PhoneNumberState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final TextEditingController _controller = TextEditingController();
  String _phoneNumber;
  Request _request = Request();
  Map _userInfo;
  int _userId;

  // 数据传递
  PhoneNumberState(phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  // 修改电话号码
  Future<ResponseModel> _changePhoneNumber(context) async {
    return await _request.post(
      '/app/admin/editInfo',
      data: {
        'id': _userId,
        'telephone': _phoneNumber,
      }
    );
  }

  Future<SharedPreferences> _share = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    // 设置初始默认值
    _controller.value = TextEditingValue(
      text: _phoneNumber,
    );

    _share.then((share) {
      setState(() {
        _userInfo = json.decode(share.getString('userInfo'));
        _userId = _userInfo['id'];
      });
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
        title: Text('设置联系电话', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('保存',
                  style: TextStyle(
                    color: _textColor,
                    fontSize: ScreenUtil.getInstance().setSp(16),
                  ),
                ),
                onPressed: () {
                  // 格式验证
                  RegExp regex = new RegExp("^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$");

                  if (!regex.hasMatch(_phoneNumber)) {
                    Fluttertoast.showToast(msg: '请输入正确的手机格式');
                    return;
                  }

                  // loading 弹窗
                  ProgressDialog.showProgress(context,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      duration: Duration(seconds: 10),
                    ),
                  );
                  _changePhoneNumber(context).then((result) {
                    if (result.code == 200) {
                      _share.then((share) {
                        _userInfo['telephone'] = _phoneNumber;
                        share.setString('userInfo', json.encode(_userInfo)).then((s) {
                          Fluttertoast.showToast(msg: '修改成功');
                          ProgressDialog.dismiss(context); // 关闭 loading
                          eventBus.fire(UpdateInfoEvent());
                          Navigator.pop(context);
                        });
                      });
                    }
                  });
                },
              ),
            ],
          )
        ],
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        color: Color.fromRGBO(245, 246, 246, 1),
        padding: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(14),
        ),
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.number,
          inputFormatters: [WhitelistingTextInputFormatter(RegExp('[0-9]')), LengthLimitingTextInputFormatter(11)],
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(14),
            color: _textColor,
          ),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            suffix: Container(
              width: ScreenUtil.getInstance().setHeight(16),
              height: ScreenUtil.getInstance().setHeight(16),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: ScreenUtil.getInstance().setHeight(12),
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _phoneNumber = value;
            });
          },
        ),
      ),
    );
  }
}