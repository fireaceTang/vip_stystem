import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/request_model.dart';
import '../utils/request.dart';
import 'home.dart';
import 'login_phone.dart';

class Login extends StatefulWidget {
  @override

  LoginState createState() => LoginState();
}

class LoginState extends State {
  bool _boolean = true;
  String _username;
  String _password;

  Request _request = new Request();

  Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  // 登录
  Future<ResponseModel> _login(context) async {
    return await _request.post('login', data:  {
      'loginName': _username,
      'password': _password,
    });
  }

  @override
  void initState() {
    _storage.then((storage) {
      if (storage.getString('userInfo') != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      }
    });

    super.initState();
  }


  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Positioned(
                  child: Image.asset('images/login_bg.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  top: 0,
                  left: 0,
                ),
                Positioned(
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/logo.png',
                        width: ScreenUtil.getInstance().setWidth(74),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(17)
                        ),
                        child: Text('VIP客户管理系统',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(18),
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                  top: ScreenUtil.getInstance().setHeight(132.5),
                ),
//                Positioned(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      GestureDetector(
//                        child: Container(
//                          padding: EdgeInsets.only(
//                              right: ScreenUtil.getInstance().setWidth(10)
//                          ),
//                          decoration: BoxDecoration(
//                            border: Border(
//                              right: BorderSide(
//                                  color: Colors.grey,
//                                  width: 1
//                              ),
//                            ),
//                          ),
//                          child: Text('密码登录',
//                            style: TextStyle(
//                              height: 1,
//                              fontSize: ScreenUtil.getInstance().setSp(18),
//                              color: _boolean ? Colors.black : Colors.grey,
//                            ),
//                          ),
//                        ),
//                        onTap: () {
//                          setState(() {
//                            _boolean = true;
//                          });
//                        },
//                      ),
//                      GestureDetector(
//                        child: Container(
//                          padding: EdgeInsets.only(
//                              left: ScreenUtil.getInstance().setWidth(10)
//                          ),
//                          child: Text('短信登录',
//                            style: TextStyle(
//                              height: 1,
//                              fontSize: ScreenUtil.getInstance().setSp(18),
//                              color: _boolean ? Colors.grey : Colors.black,
//                            ),
//                          ),
//                        ),
//                        onTap: () {
//                          setState(() {
//                            _boolean = false;
//                          });
//                        },
//                      )
//                    ],
//                  ),
//                  top: ScreenUtil.getInstance().setHeight(250.5),
//                ),
                Positioned(
                  width: ScreenUtil.getInstance().setWidth(335),
                  child: Offstage(
                    offstage: !_boolean,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: ScreenUtil.getInstance().setHeight(50),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(15)),
                              hintText: '请输入账号',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                height: 1,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(238, 238, 238, 1)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(238, 238, 238, 1)
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              _username = val;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.getInstance().setHeight(30)
                          ),
                          height: 60,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(15)),
                              hintText: '请输入密码',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                height: 1,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(238, 238, 238, 1)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(238, 238, 238, 1)
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              _password = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  top: ScreenUtil.getInstance().setHeight(315.5),
                ),
                Positioned(
                  width: ScreenUtil.getInstance().setWidth(335),
                  child: Offstage(
                    offstage: _boolean,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: ScreenUtil.getInstance().setHeight(50),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(15)),
                              hintText: '请输入手机号',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                height: 1,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(238, 238, 238, 1)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(238, 238, 238, 1)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.getInstance().setHeight(30)
                          ),
                          height: ScreenUtil.getInstance().setHeight(50),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(238, 238, 238, 1)
                                          ),
                                          left: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(238, 238, 238, 1)
                                          ),
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(238, 238, 238, 1)
                                          )
                                      )
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                      hintText: '请输入短信验证码',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      suffixIcon: Container(
                                        child: FlatButton(
                                          color: Color.fromRGBO(255, 236, 162, 1),
                                          child: Text('获取验证码',
                                            style: TextStyle(
                                              fontSize: ScreenUtil.getInstance().setSp(15),
                                              color: Color.fromRGBO(244, 201, 30, 1)
                                            ),
                                          ),
                                          onPressed: () {

                                          },
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  top: ScreenUtil.getInstance().setHeight(315.5),
                ),
                Positioned(
                  child: Offstage(
                    offstage: !_boolean,
                    child: GestureDetector(
                      child: Text('忘记密码',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(12),
                          color: Color.fromRGBO(147, 154, 169, 1)
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPhone()));
                      },
                    ),
                  ),
                  top: ScreenUtil.getInstance().setHeight(464),
                  right: ScreenUtil.getInstance().setWidth(34.5),
                ),
                Positioned(
                  child: Container(
                    width: ScreenUtil.getInstance().setWidth(335),
                    height: ScreenUtil.getInstance().setHeight(45),
                    child: FlatButton(
                      child: Text('登 录',
                        style: TextStyle(
                          color: Color.fromRGBO(42, 56, 85, 1),
                          fontSize: ScreenUtil.getInstance().setSp(18),
                        ),
                      ),
                      color: Color.fromRGBO(255, 221, 86, 1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5)))),
                      onPressed: (){
                        _login(context).then((res) {
                          if (res.code == 200) {
                            _storage.then((storage) {
                              storage.setString('userInfo', json.encode(res.data));
                              storage.setString('token', res.data['token']);
                              Fluttertoast.showToast(msg: '登录成功');
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                            });
                          }
                        });
                      },
                    ),
                  ),
                  top: ScreenUtil.getInstance().setHeight(536.5),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}