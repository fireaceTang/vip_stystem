import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info/package_info.dart';
import 'package:vip_system/pages/feedback.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'login.dart';
import 'my_info.dart';
import 'safe.dart';
import 'setting.dart';
import '../utils/event_bus.dart';

class Personal extends StatefulWidget {
  @override
  PersonalState createState() => PersonalState();
}

class User {
  int id;
  String name;
  String avatar;

  User({this.id, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['adminName'],
        avatar = json['avatar'];
}

class PersonalState extends State {
  Color _textColor = Color.fromRGBO(51, 51, 51, 1);

  User _user = new User();
  Map _userInfo;
  StreamSubscription _updateUserInfo;
  String _version;

  // 获取本地存储
  Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    getUserInfo();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      _version = packageInfo.version;
    });

    _updateUserInfo = eventBus.on<UpdateInfoEvent>().listen((event) {
      getUserInfo();
    });
  }

  void dispose() {
    super.dispose();

    _updateUserInfo.cancel();
  }

  void getUserInfo() {
    _storage.then((storage) {
      setState(() {
        _userInfo = json.decode(storage.getString('userInfo'));
        _user = User.fromJson(_userInfo);
      });
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.getInstance().setHeight(345),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        width: ScreenUtil.getInstance().setHeight(10),
                        color: Color.fromRGBO(240, 240, 240, 1),
                      )),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(87)),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: ClipOval(
                                child: _user.avatar != null ? CachedNetworkImage(
                                  width: ScreenUtil.getInstance().setHeight(96),
                                  height: ScreenUtil.getInstance().setHeight(96),
                                  imageUrl: _user.avatar,
                                  fit: BoxFit.cover,
                                ) : Image.asset(
                                  'images/image_none.png',
                                  width: ScreenUtil.getInstance().setHeight(96),
                                  height: ScreenUtil.getInstance().setHeight(96),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil.getInstance().setHeight(14),
                              ),
                              child: Text(
                                _user.name == null ? '' : _user.name,
                                style: TextStyle(
                                    color: _textColor,
                                    fontSize: ScreenUtil.getInstance().setSp(16)),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyInfo()));
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                width: ScreenUtil.getInstance().setHeight(62),
                                height: ScreenUtil.getInstance().setHeight(72),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil.getInstance().setWidth(5)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(221, 221, 221, 1),
                                          offset: Offset(0, 0),
                                          blurRadius: ScreenUtil.getInstance()
                                              .setWidth(10))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.getInstance()
                                              .setHeight(17)),
                                      child: Image.asset(
                                        'images/icon_info.png',
                                        height: ScreenUtil.getInstance()
                                            .setHeight(24),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.getInstance()
                                              .setHeight(7)),
                                      child: Text(
                                        '个人信息',
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(12),
                                            color: _textColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyInfo()));
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                width: ScreenUtil.getInstance().setHeight(62),
                                height: ScreenUtil.getInstance().setHeight(72),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(221, 221, 221, 1),
                                          offset: Offset(0, 0),
                                          blurRadius: ScreenUtil.getInstance()
                                              .setWidth(10))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.getInstance()
                                              .setHeight(17)),
                                      child: Image.asset(
                                        'images/icon_safe.png',
                                        height: ScreenUtil.getInstance()
                                            .setHeight(24),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.getInstance()
                                              .setHeight(7)),
                                      child: Text(
                                        '账号安全',
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(12),
                                            color: _textColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Safe()));
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                width: ScreenUtil.getInstance().setHeight(62),
                                height: ScreenUtil.getInstance().setHeight(72),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(221, 221, 221, 1),
                                          offset: Offset(0, 0),
                                          blurRadius: ScreenUtil.getInstance()
                                              .setWidth(10))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.getInstance()
                                              .setHeight(17)),
                                      child: Image.asset(
                                        'images/icon_setting.png',
                                        height: ScreenUtil.getInstance()
                                            .setHeight(24),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.getInstance()
                                              .setHeight(7)),
                                      child: Text(
                                        '设置',
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(12),
                                            color: _textColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Setting()));
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.getInstance().setHeight(263),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil.getInstance().setWidth(15),
                    ScreenUtil.getInstance().setHeight(17),
                    ScreenUtil.getInstance().setWidth(15),
                    0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: ScreenUtil.getInstance().setHeight(50),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(245, 246, 246, 1)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                '问题反馈',
                                style: TextStyle(
                                    fontSize: ScreenUtil.getInstance().setSp(14),
                                    color: _textColor),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: ScreenUtil.getInstance().setHeight(13),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => prefix0.Feedback()));
                      },
                    ),
                    Container(
                      height: ScreenUtil.getInstance().setHeight(50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '关于APP',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: _textColor,
                            ),
                          ),
                          Text(
                            _version == null ? '' : '版本 $_version',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: _textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(336),
                      height: ScreenUtil.getInstance().setHeight(42),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(80)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              ScreenUtil.getInstance().setHeight(5))),
                      child: FlatButton(
                        color: Color.fromRGBO(255, 164, 6, 1),
                        child: Text(
                          '退出登录',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.getInstance().setSp(16),
                          ),
                        ),
                        onPressed: () {
                          _storage.then((storage) {
                            storage.remove('userInfo');

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Login()));
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
