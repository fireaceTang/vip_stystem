import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_avatar.dart';
import 'nickname.dart';
import 'phone_number.dart';

class MyInfo extends StatefulWidget {
  @override
  MyInfoState createState() => MyInfoState();
}

class User {
  int id;
  String nickname;
  String cover;
  String phoneNumber;

  User(this.id, this.nickname, this.cover, this.phoneNumber);
}

class MyInfoState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  TextStyle _textStyle = TextStyle(
    fontSize: ScreenUtil.getInstance().setSp(14),
    color: Color.fromRGBO(102, 102, 102, 1),
  );

  User _user = User(1, '攸攸的宠物店', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1812655625,3146113561&fm=11&gp=0.jpg', '15388900360');

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
        title: Text('个人信息', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), 0, ScreenUtil.getInstance().setWidth(15), 0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: ScreenUtil.getInstance().setHeight(83),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(245, 246, 246, 1),
                        )
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('设置头像', style: _textStyle),
                    GestureDetector(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(_user.cover),
                              radius: ScreenUtil.getInstance().setWidth(30),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.getInstance().setWidth(15)
                              ),
                              child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(14),),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyAvatar(
                            avatar: _user.cover,
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              onTap: () {
                print(111);
              },
            ),
            GestureDetector(
              child: Container(
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
                  children: <Widget>[
                    Text('昵称', style: _textStyle),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(_user.nickname != null ? _user.nickname : '', style: TextStyle(color: _textColor, height: 1),),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil.getInstance().setWidth(15)
                            ),
                            child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(14),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Nickname(
                  nickname: _user.nickname
                )));
              },
            ),
            GestureDetector(
              child: Container(
                height: ScreenUtil.getInstance().setHeight(68),
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
                    Text('联系电话', style: _textStyle),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(_user.phoneNumber != null ? _user.phoneNumber : '', style: TextStyle(color: _textColor, height: 1),),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil.getInstance().setWidth(15)
                            ),
                            child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(14),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumber(phoneNumber: _user.phoneNumber)));
              },
            ),
          ],
        ),
      ),
    );
  }
}