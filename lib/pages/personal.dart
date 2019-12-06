import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login.dart';

class Personal extends StatefulWidget {
  @override

  PersonalState createState() => PersonalState();
}

class PersonalState extends State {
  Color _textColor = Color.fromRGBO(51, 51, 51, 1);

  Map _userInfo = {
    'name': '攸攸宠物店',
    'cover': 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1812655625,3146113561&fm=11&gp=0.jpg'
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
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
                  )
                ),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.getInstance().setHeight(87)
                          ),
                          child: ClipOval(
                            child: FadeInImage.assetNetwork(
                              width: ScreenUtil.getInstance().setHeight(96),
                              height: ScreenUtil.getInstance().setHeight(96),
                              placeholder: 'images/index_bg.png',
                              image: _userInfo['cover'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(14)
                          ),
                          child: Text(_userInfo['name'],
                            style: TextStyle(
                              color: _textColor,
                              fontSize: ScreenUtil.getInstance().setSp(16)
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(25)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(62),
                              height: ScreenUtil.getInstance().setHeight(72),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(5)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(221, 221, 221, 1),
                                        offset: Offset(0, 0),
                                        blurRadius: ScreenUtil.getInstance().setWidth(10)
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil.getInstance().setHeight(17)
                                    ),
                                    child: Image.asset('images/icon_info.png',
                                      height: ScreenUtil.getInstance().setHeight(24),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil.getInstance().setHeight(7)
                                    ),
                                    child: Text('个人信息',
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance().setSp(12),
                                          color: _textColor
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              print('个人信息');
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(62),
                              height: ScreenUtil.getInstance().setHeight(72),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(221, 221, 221, 1),
                                        offset: Offset(0, 0),
                                        blurRadius: ScreenUtil.getInstance().setWidth(10)
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil.getInstance().setHeight(17)
                                    ),
                                    child: Image.asset('images/icon_safe.png',
                                      height: ScreenUtil.getInstance().setHeight(24),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil.getInstance().setHeight(7)
                                    ),
                                    child: Text('账号安全',
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance().setSp(12),
                                          color: _textColor
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              print('账号安全');
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(62),
                              height: ScreenUtil.getInstance().setHeight(72),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(221, 221, 221, 1),
                                        offset: Offset(0, 0),
                                        blurRadius: ScreenUtil.getInstance().setWidth(10)
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil.getInstance().setHeight(17)
                                    ),
                                    child: Image.asset('images/icon_setting.png',
                                      height: ScreenUtil.getInstance().setHeight(24),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil.getInstance().setHeight(7)
                                    ),
                                    child: Text('设置',
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance().setSp(12),
                                          color: _textColor
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              print('设置');
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
              padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), ScreenUtil.getInstance().setHeight(17), ScreenUtil.getInstance().setWidth(15), 0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: ScreenUtil.getInstance().setHeight(50),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(245, 246, 246, 1)
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text('问题反馈',
                              style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: _textColor
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(Icons.arrow_forward_ios,
                              size: ScreenUtil.getInstance().setHeight(13),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('问题反馈');
                    },
                  ),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('关于APP',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(14),
                            color: _textColor,
                          ),
                        ),
                        Text('版本 1.0',
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
                      top: ScreenUtil.getInstance().setWidth(80)
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setHeight(5))
                    ),
                    child: FlatButton(
                      color: Color.fromRGBO(255, 164, 6, 1),
                      child: Text('退出登录'),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}