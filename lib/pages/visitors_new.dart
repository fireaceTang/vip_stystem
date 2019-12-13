import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'client_info.dart';

class User {
  int id;
  String name;
  String cover;
  String reachTime;

  User(this.id, this.name, this.cover, this.reachTime);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class VisitorsNew extends StatefulWidget {
  @override
  VisitorsNewState createState() => VisitorsNewState();
}

class VisitorsNewState extends State {
  Color _textColor = Color.fromRGBO(51, 51, 51, 1);

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
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        title: Text(
          '今日新客',
          style: TextStyle(
            color: _textColor,
            fontSize: ScreenUtil.getInstance().setSp(18),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), 0,
            ScreenUtil.getInstance().setWidth(15), 0),
        color: Color.fromRGBO(255, 247, 237, 1),
        child: ListView.builder(
          padding:
              EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(19)),
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
                    top: ScreenUtil.getInstance().setHeight(15.5)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(10))),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(_userList[index].cover),
                            radius: ScreenUtil.getInstance().setWidth(21.5),
                          ),
                          Container(
                            height: ScreenUtil.getInstance().setHeight(72.5),
                            padding: EdgeInsets.fromLTRB(
                                ScreenUtil.getInstance().setWidth(16.5),
                                ScreenUtil.getInstance().setWidth(20),
                                0,
                                ScreenUtil.getInstance().setWidth(16)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: ScreenUtil.getInstance()
                                              .setWidth(8)),
                                      child: Text(
                                        _userList[index].name,
                                        style: TextStyle(
                                            color: _textColor,
                                            fontSize: ScreenUtil.getInstance()
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '到店时间：',
                                      style: TextStyle(
                                          color: _textColor,
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(9.5),
                                          height: 1),
                                    ),
                                    Container(
                                      child: Text(
                                        _userList[index].reachTime,
                                        style: TextStyle(
                                            color: _textColor,
                                            fontSize: ScreenUtil.getInstance()
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClientInfo()));
              },
            );
          },
        ),
      ),
    );
  }
}
