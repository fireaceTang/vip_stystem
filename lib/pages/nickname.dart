import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vip_system/utils/event_bus.dart';
import 'dart:convert';

import '../model/request_model.dart';
import '../utils/request.dart';

class Nickname extends StatefulWidget {
  Nickname({
    Key key,
    @required this.nickname,
  }) : super(key: key);
  final String nickname;

  @override
  NicknameState createState() => NicknameState(nickname);
}

class NicknameState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final TextEditingController _controller = TextEditingController();
  String _nickname;
  Map _userInfo;
  int _userId;

  Request _request = Request();

  // 参数传递
  NicknameState(nickname) {
    _nickname = nickname;
  }

  Future<ResponseModel> _changeNickname(content) async {
    return await _request.post('/app/admin/editInfo', data: {
      'id': _userId,
      'adminName': _nickname,
    });
  }

  Future<SharedPreferences> _share = SharedPreferences.getInstance();

  @override
  void initState() {
    // 设置初始默认值
    _controller.value = TextEditingValue(
      text: _nickname,
    );

    _share.then((share) {
      print(share.getString('userInfo'));
      setState(() {
        _userInfo = json.decode(share.getString('userInfo'));
        _userId = _userInfo['id'];
      });
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: _textColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '设置昵称',
          style: TextStyle(
            color: _textColor,
            fontSize: ScreenUtil.getInstance().setSp(18),
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  '保存',
                  style: TextStyle(
                    color: _textColor,
                    fontSize: ScreenUtil.getInstance().setSp(16),
                  ),
                ),
                onPressed: () {
//                  _changeNickname(context).then((res) {
//                    if (res.code == 200) {
//
//                    }
//                  });
                  _share.then((share) {
                    _userInfo['adminName'] = _nickname;
                    share
                        .setString('userInfo', json.encode(_userInfo))
                        .then((s) {
                      Fluttertoast.showToast(msg: '修改成功');
                      eventBus.fire(UpdateInfoEvent());
                      Navigator.pop(context);
                    });
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
                  borderRadius: BorderRadius.circular(16)),
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
          onChanged: (val) {
            setState(() {
              _nickname = val;
            });
          },
        ),
      ),
    );
  }
}
