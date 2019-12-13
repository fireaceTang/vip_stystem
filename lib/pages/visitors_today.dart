import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_info.dart';
import 'client_info.dart';

class VisitorsToday extends StatefulWidget {
  @override
  VisitorsTodayState createState() => VisitorsTodayState();
}

// 新客
class Guest {
  int id;
  String cover;
  String reachTime;

  Guest(this.id, this.cover, this.reachTime);

  Guest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cover = json['cover'],
        reachTime = json['reachTime'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'cover': cover, 'reachTime': reachTime};
}

// 用户
class User {
  int id;
  String name;
  String cover;
  String reachTime;

  User(this.id, this.name, this.cover, this.reachTime);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        cover = json['cover'],
        reachTime = json['reachTime'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'cover': cover, 'reachTime': reachTime};
}

class VisitorsTodayState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1); // 文字默认颜色
  final List<String> _weekdayList = [
    '星期一',
    '星期二',
    '星期三',
    '星期四',
    '星期五',
    '星期六',
    '星期日'
  ];
  String _todayDate; // 今天日期
  String _todayWeekday; // 今天星期几

  // 新客列表
  final List<Guest> _guestList = [
    Guest(
        1,
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '3分钟'),
    Guest(
        2,
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1272384095,2424183537&fm=26&gp=0.jpg',
        '5分钟'),
    Guest(
        3,
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '10分钟'),
    Guest(
        4,
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1272384095,2424183537&fm=26&gp=0.jpg',
        '15分钟'),
    Guest(
        5,
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '20分钟'),
    Guest(
        6,
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1272384095,2424183537&fm=26&gp=0.jpg',
        '25分钟'),
  ];

  // 用户列表
  final List<User> _userList = [
    User(
        1,
        '庄早',
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '10:05:15'),
    User(
        2,
        '庄晚',
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1272384095,2424183537&fm=26&gp=0.jpg',
        '12:22:32'),
    User(
        3,
        '庄早早',
        'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1228827703,3194785880&fm=26&gp=0.jpg',
        '12:22:32'),
    User(
        4,
        '庄晚晚',
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '12:22:32'),
    User(
        5,
        '庄早晚',
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '12:22:32'),
    User(
        6,
        '庄晚早',
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '12:22:32'),
    User(
        7,
        '庄庄庄',
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '12:22:32'),
    User(
        7,
        '庄庄庄',
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '12:22:32'),
    User(
        7,
        '庄庄庄',
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2226190985,1365245624&fm=26&gp=0.jpg',
        '12:22:32'),
  ];

  @override
  void initState() {
    final DateTime today = DateTime.now();

    _todayDate = today.year.toString() +
        '年' +
        today.month.toString().padLeft(2, '0') +
        '月' +
        today.day.toString().padLeft(2, '0') +
        '日';
    _todayWeekday = _weekdayList[today.weekday - 1];

    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      child: Container(
        color: Color.fromRGBO(255, 247, 237, 1),
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
              child: Text(
                '大集方圆',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil.getInstance().setSp(20),
                  fontWeight: FontWeight.w600,
                ),
              ),
              top: ScreenUtil.getInstance().setHeight(40),
              left: ScreenUtil.getInstance().setWidth(17),
            ),
            Positioned(
              child: Text('VIP客户管理系统',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil.getInstance().setSp(20),
                    fontWeight: FontWeight.w600,
                  )),
              top: ScreenUtil.getInstance().setHeight(66),
              left: ScreenUtil.getInstance().setWidth(17),
            ),
            Positioned(
              child: Row(
                children: <Widget>[
                  Text(_todayDate != null ? _todayDate : '2019年06年30日',
                      style: TextStyle(
                          color: _textColor,
                          fontSize: ScreenUtil.getInstance().setSp(13))),
                  Container(
                    child: Text(_todayWeekday != null ? _todayWeekday : '星期日',
                        style: TextStyle(
                            color: _textColor,
                            fontSize: ScreenUtil.getInstance().setSp(13))),
                    margin: EdgeInsets.only(
                        left: ScreenUtil.getInstance().setWidth(10)),
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
                  Text('新客到访',
                      style: TextStyle(
                        color: _textColor,
                        fontSize: ScreenUtil.getInstance().setSp(10),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        ScreenUtil.getInstance().setWidth(5),
                        0,
                        ScreenUtil.getInstance().setWidth(5),
                        0),
                    child: Text('50',
                        style: TextStyle(
                          color: _textColor,
                          fontSize: ScreenUtil.getInstance().setSp(20),
                        )),
                  ),
                  Text('人',
                      style: TextStyle(
                        color: _textColor,
                        fontSize: ScreenUtil.getInstance().setSp(10),
                      )),
                ],
              ),
              top: ScreenUtil.getInstance().setHeight(150),
              right: ScreenUtil.getInstance().setWidth(14.5),
            ),
            Positioned(
              height: 100,
              child: Container(
                width: MediaQuery.of(context).size.width -
                    ScreenUtil.getInstance().setWidth(15),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _guestList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        width: ScreenUtil.getInstance().setWidth(183.5),
                        margin: EdgeInsets.only(
                            right: ScreenUtil.getInstance().setWidth(11.5)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left:
                                      ScreenUtil.getInstance().setWidth(12.5)),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(_guestList[index].cover),
                                radius: ScreenUtil.getInstance().setWidth(34),
                              ),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(102.5),
                              height: ScreenUtil.getInstance().setHeight(67),
                              padding: EdgeInsets.fromLTRB(
                                  ScreenUtil.getInstance().setWidth(22.5),
                                  0,
                                  ScreenUtil.getInstance().setWidth(19),
                                  0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color: Color.fromRGBO(249, 206, 145, 1),
                                        size: ScreenUtil.getInstance()
                                            .setWidth(15),
                                      ),
                                      Text(
                                          _guestList[index].reachTime != null
                                              ? _guestList[index].reachTime
                                              : '3分钟',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(12),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('新客',
                                          style: TextStyle(
                                            color: _textColor,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(12),
                                          )),
                                      SizedBox(
                                        width: ScreenUtil.getInstance()
                                            .setWidth(16),
                                        height: ScreenUtil.getInstance()
                                            .setWidth(16),
                                        child: ClipOval(
                                          child: Container(
                                            color: Color.fromRGBO(
                                                253, 243, 203, 1),
                                            child: Image.asset(
                                              'images/icon_add.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
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
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddInfo()));
                      },
                    );
                  },
                ),
              ),
              top: ScreenUtil.getInstance().setHeight(180.5),
              left: ScreenUtil.getInstance().setWidth(15),
            ),
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width -
                    ScreenUtil.getInstance().setWidth(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text('会员到店',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(17.5),
                              color: _textColor,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text('会员到店',
                              style: TextStyle(
                                color: _textColor,
                                fontSize: ScreenUtil.getInstance().setSp(9.5),
                              )),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenUtil.getInstance().setWidth(5),
                                0,
                                ScreenUtil.getInstance().setWidth(5),
                                0),
                            child: Text('89',
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(16),
                                    color: _textColor)),
                          ),
                          Text(
                            '人',
                            style: TextStyle(
                              color: _textColor,
                              fontSize: ScreenUtil.getInstance().setSp(9.5),
                            ),
                          )
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
              width: MediaQuery.of(context).size.width -
                  ScreenUtil.getInstance().setWidth(30),
              height: MediaQuery.of(context).size.height -
                  ScreenUtil.getInstance().setHeight(410),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      bottom: ScreenUtil.getInstance().setHeight(19)),
                  shrinkWrap: true,
                  itemCount: _userList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width -
                            ScreenUtil.getInstance().setWidth(30),
                        height: ScreenUtil.getInstance().setHeight(72.5),
                        padding: EdgeInsets.fromLTRB(
                            ScreenUtil.getInstance().setWidth(13),
                            0,
                            ScreenUtil.getInstance().setWidth(13),
                            0),
                        margin: EdgeInsets.only(
                            top: index == 0
                                ? 0
                                : ScreenUtil.getInstance().setHeight(15)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              ScreenUtil.getInstance().setWidth(10))),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(_userList[index].cover),
                                    radius:
                                        ScreenUtil.getInstance().setWidth(21.5),
                                  ),
                                  Container(
                                    height: ScreenUtil.getInstance()
                                        .setHeight(72.5),
                                    padding: EdgeInsets.fromLTRB(
                                        ScreenUtil.getInstance().setWidth(16.5),
                                        ScreenUtil.getInstance().setWidth(20),
                                        0,
                                        ScreenUtil.getInstance().setWidth(16)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right:
                                                      ScreenUtil.getInstance()
                                                          .setWidth(8)),
                                              child: Text(
                                                _userList[index].name,
                                                style: TextStyle(
                                                    color: _textColor,
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(16),
                                                    height: 1),
                                              ),
                                            ),
                                            Container(
                                              width: ScreenUtil.getInstance().setWidth(70),
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(14),
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage('images/member_level.png'),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  left: ScreenUtil.getInstance().setWidth(10)
                                                ),
                                                child: Center(
                                                  child: Text('黄金会员',
                                                    style: TextStyle(
                                                      fontSize: ScreenUtil.getInstance().setSp(10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '到店时间：',
                                              style: TextStyle(
                                                  color: _textColor,
                                                  fontSize:
                                                      ScreenUtil.getInstance()
                                                          .setSp(9.5),
                                                  height: 1),
                                            ),
                                            Container(
                                              child: Text(
                                                _userList[index].reachTime,
                                                style: TextStyle(
                                                    color: _textColor,
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(9.5),
                                                    height: 1),
                                              ),
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
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: _textColor,
                                size: ScreenUtil.getInstance().setWidth(13),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientInfo()));
                      },
                    );
                  },
                ),
              ),
              top: ScreenUtil.getInstance().setHeight(360),
              left: ScreenUtil.getInstance().setWidth(15),
            ),
          ],
        ),
      ),
    ));
  }
}
