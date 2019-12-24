import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vip_system/model/guestToday.dart';
import 'package:vip_system/model/request_model.dart';
import 'package:vip_system/utils/request.dart';

import 'add_info.dart';
import 'client_info.dart';

class VisitorsToday extends StatefulWidget {
  @override
  VisitorsTodayState createState() => VisitorsTodayState();
}

// 用户
class User {
  int vipConsumerId;
  String vipConsumerName;
  String avatar;
  String reachTime;

  User(this.vipConsumerId, this.vipConsumerName, this.avatar, this.reachTime);

  User.fromJson(Map<String, dynamic> json)
      : vipConsumerId = json['vipConsumerId'],
        vipConsumerName = json['vipConsumerName'],
        avatar = json['avatar'],
        reachTime = json['reachTime'];

  Map<String, dynamic> toJson() =>
      {
        'vipConsumerId': vipConsumerId,
        'vipConsumerName': vipConsumerName,
        'avatar': avatar,
        'reachTime': reachTime
      };
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
  String _guestCount = '0';
  String _vipCount = '0';

  // 新客列表
  List<dynamic> _guestList = [];

  // 用户列表
  List<dynamic> _userList = [];

  Request _request = Request();

  // 今日新客
  Future<ResponseModel> _getGuestList() async {
    return await _request.get('/app/face/newGuestToday');
  }

  // 今日会员
  Future<ResponseModel> _getVipList() async {
    return await _request.get(
      '/app/face/newVipToday',
    );
  }

  @override
  void initState() {
    super.initState();

    getTodayDate();
    // 获取今日新客
    getTodayGuest();

    // 获取今日 VIP
    getTodayVip();
  }

  // 获取今日 VIP
  void getTodayVip() {
    _getVipList().then((res) {
      if (res.code == 200) {
        setState(() {
          List _cacheList = res.data['datalist'];
          _vipCount = res.data['people'].toString();

          _cacheList.forEach((item) {
            item['reachTime'] = item['arrivalTime'].toString().split(' ')[1];
          });

          _userList = _cacheList;
        });
      }
    });
  }

  // 获取今日新客
  void getTodayGuest() {
    _getGuestList().then((res) {
      if (res.code == 200) {
        setState(() {
          List _cacheList = res.data['datalist'];
          _guestCount = res.data['people'].toString();

          _cacheList.forEach((item) {
            item['reachTime'] = getCutDown(item['arrivalTime']);
          });

          print(_cacheList);
          _guestList = _cacheList;
        });
      }
    });
  }

  // 计算时间差
  String getCutDown(reachTime) {
    final DateTime now = DateTime.now();
    final DateTime before = DateTime.parse(reachTime);

    var _diff = before.difference(now);
    print(_diff.inHours);
    String _diffString = '';

    if (_diff.inHours != 0) {
      _diffString = _diff.inHours.toString() + '小时前';
    } else if (_diff.inMinutes != 0) {
      _diffString = _diff.inMinutes.toString() + '分钟前';
    } else {
      _diffString = '1分钟前';
    }

    return _diffString;
  }

  // 获取今天日期
  void getTodayDate() {
    final DateTime today = DateTime.now();

    _todayDate = today.year.toString() +
        '年' +
        today.month.toString().padLeft(2, '0') +
        '月' +
        today.day.toString().padLeft(2, '0') +
        '日';
    _todayWeekday = _weekdayList[today.weekday - 1];
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                        child: Text(
                            _todayWeekday != null ? _todayWeekday : '星期日',
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
                        child: Text(_guestCount,
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width -
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
                                    backgroundImage: NetworkImage(
                                        _guestList.length == 0
                                            ? ''
                                            : _guestList[index]['img']),
                                    backgroundColor: Colors.transparent,
                                    radius: ScreenUtil.getInstance().setWidth(
                                        34),
                                  ),
                                ),
                                Container(
                                  width: ScreenUtil.getInstance().setWidth(
                                      102.5),
                                  height: ScreenUtil.getInstance().setHeight(
                                      67),
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
                                            color: Color.fromRGBO(
                                                249, 206, 145, 1),
                                            size: ScreenUtil.getInstance()
                                                .setWidth(15),
                                          ),
                                          Text(
                                            _guestList.length != null &&
                                                _guestList[index]
                                                ['reachTime'] !=
                                                    null
                                                ? _guestList[index]['reachTime']
                                                : '',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(10),
                                            ),
                                          ),
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
                                                fontSize: ScreenUtil
                                                    .getInstance()
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
                                MaterialPageRoute(
                                    builder: (context) => AddInfo()));
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width -
                        ScreenUtil.getInstance().setWidth(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text('会员到店',
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(
                                      17.5),
                                  color: _textColor,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('会员到店',
                                  style: TextStyle(
                                    color: _textColor,
                                    fontSize: ScreenUtil.getInstance().setSp(
                                        9.5),
                                  )),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    ScreenUtil.getInstance().setWidth(5),
                                    0,
                                    ScreenUtil.getInstance().setWidth(5),
                                    0),
                                child: Text(_vipCount,
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width -
                      ScreenUtil.getInstance().setWidth(30),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height -
                      ScreenUtil.getInstance().setHeight(410),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: ScreenUtil.getInstance().setHeight(19)),
                      shrinkWrap: true,
                      itemCount: _userList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width -
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
                                        backgroundImage: NetworkImage(
                                            _userList[index]['avatar'] == null
                                                ? ''
                                                : _userList[index]['avatar']),
                                        backgroundColor: Colors.transparent,
                                        radius:
                                        ScreenUtil.getInstance().setWidth(21.5),
                                      ),
                                      Container(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(72.5),
                                        padding: EdgeInsets.fromLTRB(
                                            ScreenUtil.getInstance().setWidth(
                                                16.5),
                                            ScreenUtil.getInstance().setWidth(
                                                20),
                                            0,
                                            ScreenUtil.getInstance().setWidth(
                                                16)),
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
                                                    _userList[index]
                                                    ['vipConsumerName'],
                                                    style: TextStyle(
                                                        color: _textColor,
                                                        fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(16),
                                                        height: 1),
                                                  ),
                                                ),
                                                Container(
                                                  width: ScreenUtil
                                                      .getInstance()
                                                      .setWidth(70),
                                                  height: ScreenUtil
                                                      .getInstance()
                                                      .setHeight(14),
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/member_level.png'),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left:
                                                        ScreenUtil.getInstance()
                                                            .setWidth(10)),
                                                    child: Center(
                                                      child: Text(
                                                        _userList[index]
                                                        ['labelName'],
                                                        style: TextStyle(
                                                          fontSize: ScreenUtil
                                                              .getInstance()
                                                              .setSp(10),
                                                          height: 1.1,
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
                                                    _userList[index]['reachTime'],
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
