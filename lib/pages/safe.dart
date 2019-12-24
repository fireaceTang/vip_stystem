import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vip_system/pages/login.dart';

import '../utils/request.dart';
import '../model/request_model.dart';

class Safe extends StatefulWidget {
  @override
  SafeState createState() => SafeState();
}

class SafeState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final TextStyle _textStyle = TextStyle(
    color: Color.fromRGBO(51, 51, 51, 1),
    fontSize: ScreenUtil.getInstance().setSp(14),
  );
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _oldPsw;
  String _newPsw;
  String _errorText_1;
  String _errorText_2;
  String _errorText_3;

  Request _request = Request();
  Future<SharedPreferences> _share = SharedPreferences.getInstance();
  int _userId;

  Future<ResponseModel> _changePsw () async {
    return await _request.post(
      '/app/admin/editInfo',
      data: {
        'id': _userId,
        'oldPassword': _oldPsw,
        'password': _newPsw,
      }
    );
  }

  @override
  void initState() {
    super.initState();

    // 获取用户 id
    _share.then((share) {
      _userId = json.decode(share.getString('userInfo'))['id'];
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
        title: Text('修改密码', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), 0, ScreenUtil.getInstance().setWidth(15), 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil.getInstance().setHeight(73),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(245, 246, 246, 1),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('旧密码', style: _textStyle,),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(200),
                        child: TextFormField(
                          style: _textStyle,
                          textAlign: TextAlign.end,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请输入旧密码',
                            counterText: _errorText_1,
                            counterStyle: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          autovalidate: true,
                          onChanged: (v) {
                            setState(() {
                              _errorText_1 = null;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              if (value != '') {
                                if (value.length < 6) {
                                  _errorText_1 = '密码长度不能小于6位';
                                  _errorText_2 = null;
                                  _errorText_3 = null;
                                } else {
                                  _errorText_1 = null;
                                  _oldPsw = value;
                                }
                              } else {
                                _errorText_1 = '密码不能为空';
                                _errorText_2 = null;
                                _errorText_3 = null;
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil.getInstance().setHeight(68),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(245, 246, 246, 1),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('新密码', style: _textStyle,),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(200),
                        child: TextFormField(
                          style: _textStyle,
                          textAlign: TextAlign.end,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请输入密码',
                            errorMaxLines: 1,
                            counterText: _errorText_2,
                            counterStyle: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              _errorText_2 = null;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              if (_errorText_1 == null) {
                                if (value != '') {
                                  if (value.length < 6) {
                                    _errorText_2 = '密码长度不能小于6位';
                                    _errorText_3 = null;
                                  } else {
                                    if (value == _oldPsw) {
                                      _errorText_2 = '新旧密码不能一样';
                                      _errorText_3 = null;
                                    } else {
                                      _errorText_2 = null;
                                      _newPsw = value;
                                    }
                                  }
                                } else {
                                  _errorText_2 = '密码不能为空';
                                  _errorText_3 = null;
                                }
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil.getInstance().setHeight(68),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(245, 246, 246, 1),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('新密码', style: _textStyle,),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(200),
                        child: TextFormField(
                          style: _textStyle,
                          textAlign: TextAlign.end,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请再次输入密码',
                            errorMaxLines: 1,
                            counterText: _errorText_3,
                            counterStyle: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              _errorText_3 = null;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              if (_errorText_1 == null && _errorText_2 == null) {
                                if (value != '') {
                                  if (value.length < 6) {
                                    _errorText_3 = '密码长度不能小于6位';
                                  } else {
                                    if (value == _newPsw) {
                                      _errorText_3 = null;
                                    } else {
                                      _errorText_3 = '两次输入密码不一致';
                                    }
                                  }
                                } else {
                                  _errorText_3 = '密码不能为空';
                                }
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(336),
                  height: ScreenUtil.getInstance().setHeight(42),
                  margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(57),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5))),
                  ),
                  child: FlatButton(
                    color: Color.fromRGBO(255, 164, 6, 1),
                    child: Text('保 存',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().setSp(16),
                      ),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();

                      // 判断验证是否通过
                      if (_errorText_1 == null && _errorText_2 == null && _errorText_3 == null) {
                        _changePsw().then((result) {
                          if (result.code == 200) {
                            _share.then((share) {
                              share.remove('userInfo').then((r) {
                                Fluttertoast.showToast(msg: '修改成功，请重新登录');
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => route == null);
                              });
                            });
                          }
                        });
                      } else {
                        return;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}