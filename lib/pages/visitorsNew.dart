import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'clientInfo.dart';

class VisitorsNew extends StatefulWidget {
  @override

  VisitorsNewState createState() => VisitorsNewState();
}

class VisitorsNewState extends State{
  Color _textColor = Color.fromRGBO(42, 56, 85, 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        title: Text('今日新客', style: TextStyle(
          color: _textColor
        ),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), 0, ScreenUtil.getInstance().setWidth(15), 0),
        color: Color.fromRGBO(255, 247, 237, 1),
        child: ListView(
          padding: EdgeInsets.only(
            bottom: ScreenUtil.getInstance().setHeight(19)
          ),
          shrinkWrap: true,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width - ScreenUtil.getInstance().setWidth(30),
                height: ScreenUtil.getInstance().setHeight(72.5),
                padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(19)
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
                    top: ScreenUtil.getInstance().setHeight(19)
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
                    top: ScreenUtil.getInstance().setHeight(19)
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
                    top: ScreenUtil.getInstance().setHeight(19)
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
                    top: ScreenUtil.getInstance().setHeight(19)
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
                    top: ScreenUtil.getInstance().setHeight(19)
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
                    top: ScreenUtil.getInstance().setHeight(19)
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
                    top: ScreenUtil.getInstance().setHeight(19)
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
          ],
        ),
      ),
    );
  }
}