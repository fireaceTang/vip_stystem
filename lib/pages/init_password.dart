import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login.dart';

class InitPassword extends StatefulWidget {
  @override
  InitPasswordState createState() => InitPasswordState();
}

class InitPasswordState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final TextStyle _textStyle = TextStyle(
    color: Color.fromRGBO(51, 51, 51, 1),
    fontSize: ScreenUtil.getInstance().setSp(14),
  );
  GlobalKey _globalKey = GlobalKey<FormState>();

  @override

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
        title: Text('设置初始密码', style: TextStyle(
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
            key: _globalKey,
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
                      Text('初始密码', style: _textStyle,),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(200),
                        child: TextFormField(
                          style: _textStyle,
                          textAlign: TextAlign.end,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请输入密码',
                          ),
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
                      Text('再次确认', style: _textStyle,),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(200),
                        child: TextFormField(
                          style: _textStyle,
                          textAlign: TextAlign.end,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请再次输入密码',
                          ),
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
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => new Login()), (Route<dynamic> route) => false);
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