import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientInfo extends StatefulWidget {
  @override
  
  ClientInfoState createState() => ClientInfoState();
}

class ClientInfoState extends State {
  Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  TextStyle _textStyle = TextStyle(
    fontSize: ScreenUtil.getInstance().setSp(14),
    color: Color.fromRGBO(102, 102, 102, 1),
  );

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
        title: Text('客户信息', style: TextStyle(
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
            Container(
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
                          Text('照片', style: _textStyle),
                          Container(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/login_bg.png'),
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
                                  color: Color.fromRGBO(245, 246, 246, 1)
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('姓名', style: _textStyle),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('庄早早', style: TextStyle(color: _textColor, height: 1),),
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
                                Text('15388900360', style: TextStyle(color: _textColor, height: 1),),
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
                      print(111);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: ScreenUtil.getInstance().setHeight(68),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('用户属性', style: _textStyle),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('黄金会员', style: TextStyle(color: _textColor, height: 1),),
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
                      print(111);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(53)
              ),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Text('备注：' + '喜欢下午到店，喜欢下午到店，喜欢下午到店，喜欢下午到店，喜欢下午到店，喜欢下午到店。', style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(12),
                    color: Color.fromRGBO(102, 102, 102, 1),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}