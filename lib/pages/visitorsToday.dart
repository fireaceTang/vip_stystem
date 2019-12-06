import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'addInfo.dart';
import 'clientInfo.dart';

class VisitorsToday extends StatefulWidget {
  @override

  VisitorsTodayState createState() => VisitorsTodayState();
}

class VisitorsTodayState extends State{
  Color _textColor = Color.fromRGBO(42, 56, 85, 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Container(
          color: Color.fromRGBO(246, 247, 249, 1),
          child: Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              Positioned(
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: ScreenUtil.getInstance().setHeight(228),
                  image: AssetImage('images/index_bg.png'),
                  fit: BoxFit.cover,
                ),
                top: 0,
                left: 0,
              ),
              Positioned(
                child: Text('大集方圆', style: TextStyle(color: Colors.black, fontSize: ScreenUtil.getInstance().setSp(20), fontWeight: FontWeight.w600,),),
                top: ScreenUtil.getInstance().setHeight(40),
                left: ScreenUtil.getInstance().setWidth(17),
              ),
              Positioned(
                child: Text('VIP客户管理系统', style: TextStyle(color: Colors.black, fontSize: ScreenUtil.getInstance().setSp(20), fontWeight: FontWeight.w600,)),
                top: ScreenUtil.getInstance().setHeight(66),
                left: ScreenUtil.getInstance().setWidth(17),
              ),
              Positioned(
                child: Row(
                  children: <Widget>[
                    Text('2019年6月30日', style: TextStyle(color: _textColor, fontSize: ScreenUtil.getInstance().setSp(13))),
                    Container(
                      child: Text('星期日', style: TextStyle(color: _textColor, fontSize: ScreenUtil.getInstance().setSp(13))),
                      margin: EdgeInsets.only(
                          left: ScreenUtil.getInstance().setWidth(10)
                      ),
                    )
                  ],
                ),
                top: ScreenUtil.getInstance().setHeight(103),
                left: ScreenUtil.getInstance().setWidth(20.5),
              ),
              Positioned(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('新客到访', style: TextStyle(color: _textColor, fontSize: ScreenUtil.getInstance().setSp(10),)),
                    Container(
                      margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(5), 0, ScreenUtil.getInstance().setWidth(5), 0),
                      child: Text('50', style: TextStyle(
                        color: _textColor,
                        fontSize: ScreenUtil.getInstance().setSp(20),
                      )),
                    ),
                    Text('人', style: TextStyle(color: _textColor, fontSize: ScreenUtil.getInstance().setSp(10),)),
                  ],
                ),
                top: ScreenUtil.getInstance().setHeight(150),
                right: ScreenUtil.getInstance().setWidth(14.5),
              ),
              Positioned(
                height: 100,
                child: Container(
                  width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(15),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: ScreenUtil.getInstance().setWidth(183.5),
                        margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(11.5)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.getInstance().setWidth(12.5)
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/login_bg.png'),
                                radius: ScreenUtil.getInstance().setWidth(34),
                              ),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(102.5),
                              height: ScreenUtil.getInstance().setHeight(67),
                              padding: EdgeInsets.fromLTRB(
                                ScreenUtil.getInstance().setWidth(22.5), 0,
                                ScreenUtil.getInstance().setWidth(19), 0
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.alarm, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                      Text('3分钟', style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('新客', style: TextStyle(
                                        color: _textColor,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      )),
                                      SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(15),
                                        height: ScreenUtil.getInstance().setHeight(15),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.add_circle_outline, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddInfo()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(183.5),
                        margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(11.5)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.getInstance().setWidth(12.5)
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/login_bg.png'),
                                radius: ScreenUtil.getInstance().setWidth(34),
                              ),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(102.5),
                              height: ScreenUtil.getInstance().setHeight(67),
                              padding: EdgeInsets.fromLTRB(
                                  ScreenUtil.getInstance().setWidth(22.5), 0,
                                  ScreenUtil.getInstance().setWidth(19), 0
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.alarm, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                      Text('3分钟', style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('新客', style: TextStyle(
                                        color: _textColor,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      )),
                                      SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(15),
                                        height: ScreenUtil.getInstance().setHeight(15),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.add_circle_outline, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddInfo()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(183.5),
                        margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(11.5)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.getInstance().setWidth(12.5)
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/login_bg.png'),
                                radius: ScreenUtil.getInstance().setWidth(34),
                              ),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(102.5),
                              height: ScreenUtil.getInstance().setHeight(67),
                              padding: EdgeInsets.fromLTRB(
                                  ScreenUtil.getInstance().setWidth(22.5), 0,
                                  ScreenUtil.getInstance().setWidth(19), 0
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.alarm, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                      Text('3分钟', style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('新客', style: TextStyle(
                                        color: _textColor,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      )),
                                      SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(15),
                                        height: ScreenUtil.getInstance().setHeight(15),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.add_circle_outline, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddInfo()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(183.5),
                        margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(11.5)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.getInstance().setWidth(12.5)
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/login_bg.png'),
                                radius: ScreenUtil.getInstance().setWidth(34),
                              ),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(102.5),
                              height: ScreenUtil.getInstance().setHeight(67),
                              padding: EdgeInsets.fromLTRB(
                                  ScreenUtil.getInstance().setWidth(22.5), 0,
                                  ScreenUtil.getInstance().setWidth(19), 0
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.alarm, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                      Text('3分钟', style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('新客', style: TextStyle(
                                        color: _textColor,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      )),
                                      SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(15),
                                        height: ScreenUtil.getInstance().setHeight(15),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.add_circle_outline, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddInfo()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(183.5),
                        margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(11.5)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.getInstance().setWidth(12.5)
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/login_bg.png'),
                                radius: ScreenUtil.getInstance().setWidth(34),
                              ),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(102.5),
                              height: ScreenUtil.getInstance().setHeight(67),
                              padding: EdgeInsets.fromLTRB(
                                  ScreenUtil.getInstance().setWidth(22.5), 0,
                                  ScreenUtil.getInstance().setWidth(19), 0
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.alarm, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                      Text('3分钟', style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('新客', style: TextStyle(
                                        color: _textColor,
                                        fontSize: ScreenUtil.getInstance().setSp(12),
                                      )),
                                      SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(15),
                                        height: ScreenUtil.getInstance().setHeight(15),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.add_circle_outline, color: Color.fromRGBO(249, 206, 145, 1), size: ScreenUtil.getInstance().setWidth(15),),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddInfo()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                top: ScreenUtil.getInstance().setHeight(180.5),
                left: ScreenUtil.getInstance().setWidth(15),
              ),
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('会员到店', style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(17.5),
                            color: _textColor,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text('会员到店', style: TextStyle(
                              color: _textColor,
                              fontSize: ScreenUtil.getInstance().setSp(9.5),
                            )),
                            Container(
                              margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(5), 0, ScreenUtil.getInstance().setWidth(5), 0),
                              child: Text('89', style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(16),
                                  color: _textColor
                              )),
                            ),
                            Text('人', style: TextStyle(
                                color: _textColor,
                              fontSize: ScreenUtil.getInstance().setSp(9.5),
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                top: ScreenUtil.getInstance().setHeight(320.5),
                left: ScreenUtil.getInstance().setWidth(14.5),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                height: MediaQuery.of(context).size.height - ScreenUtil.getInstance().setHeight(360),
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.only(
                        bottom: ScreenUtil.getInstance().setHeight(70)
                    ),
                    shrinkWrap: true,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                          height: ScreenUtil.getInstance().setHeight(72.5),
                          padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.getInstance().setHeight(19)
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/login_bg.png'),
                                      radius: ScreenUtil.getInstance().setWidth(21.5),
                                    ),
                                    Container(
                                      height: ScreenUtil.getInstance().setHeight(72.5),
                                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(16.5), ScreenUtil.getInstance().setWidth(20), 0, ScreenUtil.getInstance().setWidth(16)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: ScreenUtil.getInstance().setWidth(8)
                                                ),
                                                child: Text('庄早', style: TextStyle(
                                                  color: _textColor,
                                                  fontSize: ScreenUtil.getInstance().setSp(16),
                                                  height: 1
                                                ),),
                                              ),
                                              Image(
                                                height: ScreenUtil.getInstance().setHeight(14),
                                                image: AssetImage('images/member_gold.png'),
                                                fit: BoxFit.fitHeight,
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('到店时间：', style: TextStyle(
                                                  color: _textColor,
                                                  fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                  height: 1
                                              ),),
                                              Container(
                                                child: Text('12:22:32', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                    height: 1
                                                ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(13),),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientInfo()));
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                          height: ScreenUtil.getInstance().setHeight(72.5),
                          padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.getInstance().setHeight(19)
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/login_bg.png'),
                                      radius: ScreenUtil.getInstance().setWidth(21.5),
                                    ),
                                    Container(
                                      height: ScreenUtil.getInstance().setHeight(72.5),
                                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(16.5), ScreenUtil.getInstance().setWidth(20), 0, ScreenUtil.getInstance().setWidth(16)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: ScreenUtil.getInstance().setWidth(8)
                                                ),
                                                child: Text('庄早', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(16),
                                                    height: 1
                                                ),),
                                              ),
                                              Image(
                                                height: ScreenUtil.getInstance().setHeight(14),
                                                image: AssetImage('images/member_gold.png'),
                                                fit: BoxFit.fitHeight,
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('到店时间：', style: TextStyle(
                                                  color: _textColor,
                                                  fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                  height: 1
                                              ),),
                                              Container(
                                                child: Text('12:22:32', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                    height: 1
                                                ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(13),),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientInfo()));
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                          height: ScreenUtil.getInstance().setHeight(72.5),
                          padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.getInstance().setHeight(19)
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/login_bg.png'),
                                      radius: ScreenUtil.getInstance().setWidth(21.5),
                                    ),
                                    Container(
                                      height: ScreenUtil.getInstance().setHeight(72.5),
                                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(16.5), ScreenUtil.getInstance().setWidth(20), 0, ScreenUtil.getInstance().setWidth(16)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: ScreenUtil.getInstance().setWidth(8)
                                                ),
                                                child: Text('庄早', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(16),
                                                    height: 1
                                                ),),
                                              ),
                                              Image(
                                                height: ScreenUtil.getInstance().setHeight(14),
                                                image: AssetImage('images/member_gold.png'),
                                                fit: BoxFit.fitHeight,
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('到店时间：', style: TextStyle(
                                                  color: _textColor,
                                                  fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                  height: 1
                                              ),),
                                              Container(
                                                child: Text('12:22:32', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                    height: 1
                                                ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(13),),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientInfo()));
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                          height: ScreenUtil.getInstance().setHeight(72.5),
                          padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.getInstance().setHeight(19)
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/login_bg.png'),
                                      radius: ScreenUtil.getInstance().setWidth(21.5),
                                    ),
                                    Container(
                                      height: ScreenUtil.getInstance().setHeight(72.5),
                                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(16.5), ScreenUtil.getInstance().setWidth(20), 0, ScreenUtil.getInstance().setWidth(16)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: ScreenUtil.getInstance().setWidth(8)
                                                ),
                                                child: Text('庄早', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(16),
                                                    height: 1
                                                ),),
                                              ),
                                              Image(
                                                height: ScreenUtil.getInstance().setHeight(14),
                                                image: AssetImage('images/member_gold.png'),
                                                fit: BoxFit.fitHeight,
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('到店时间：', style: TextStyle(
                                                  color: _textColor,
                                                  fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                  height: 1
                                              ),),
                                              Container(
                                                child: Text('12:22:32', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                    height: 1
                                                ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(13),),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientInfo()));
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                          height: ScreenUtil.getInstance().setHeight(72.5),
                          padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil.getInstance().setHeight(19)
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/login_bg.png'),
                                      radius: ScreenUtil.getInstance().setWidth(21.5),
                                    ),
                                    Container(
                                      height: ScreenUtil.getInstance().setHeight(72.5),
                                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(16.5), ScreenUtil.getInstance().setWidth(20), 0, ScreenUtil.getInstance().setWidth(16)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: ScreenUtil.getInstance().setWidth(8)
                                                ),
                                                child: Text('庄早', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(16),
                                                    height: 1
                                                ),),
                                              ),
                                              Image(
                                                height: ScreenUtil.getInstance().setHeight(14),
                                                image: AssetImage('images/member_gold.png'),
                                                fit: BoxFit.fitHeight,
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('到店时间：', style: TextStyle(
                                                  color: _textColor,
                                                  fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                  height: 1
                                              ),),
                                              Container(
                                                child: Text('12:22:32', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                    height: 1
                                                ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(13),),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientInfo()));
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                          height: ScreenUtil.getInstance().setHeight(72.5),
                          padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/login_bg.png'),
                                      radius: ScreenUtil.getInstance().setWidth(21.5),
                                    ),
                                    Container(
                                      height: ScreenUtil.getInstance().setHeight(72.5),
                                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(16.5), ScreenUtil.getInstance().setWidth(20), 0, ScreenUtil.getInstance().setWidth(16)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: ScreenUtil.getInstance().setWidth(8)
                                                ),
                                                child: Text('庄早', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(16),
                                                    height: 1
                                                ),),
                                              ),
                                              Image(
                                                height: ScreenUtil.getInstance().setHeight(14),
                                                image: AssetImage('images/member_gold.png'),
                                                fit: BoxFit.fitHeight,
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('到店时间：', style: TextStyle(
                                                  color: _textColor,
                                                  fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                  height: 1
                                              ),),
                                              Container(
                                                child: Text('12:22:32', style: TextStyle(
                                                    color: _textColor,
                                                    fontSize: ScreenUtil.getInstance().setSp(9.5),
                                                    height: 1
                                                ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios, color: _textColor, size: ScreenUtil.getInstance().setWidth(13),),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientInfo()));
                        },
                      ),
                    ],
                  ),
                ),
                top: ScreenUtil.getInstance().setHeight(360),
                left: ScreenUtil.getInstance().setWidth(15),
              ),
            ],
          ),
        ),
      )
    );
  }
}