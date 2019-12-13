import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'visitors_today.dart';
import 'visitors_new.dart';
import 'member.dart';
import 'personal.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State {
  int _currentIndex = 0;
  Color _textColor = Color.fromRGBO(51, 51, 51, 1);

  List<Widget> list = List();
  List<Color> _iconColorList = [
    Color.fromRGBO(159, 159, 159, 1),
    Color.fromRGBO(159, 159, 159, 1),
    Color.fromRGBO(159, 159, 159, 1),
    Color.fromRGBO(159, 159, 159, 1),
  ];

  @override

  void initState() {
    list
      ..add(VisitorsToday())
      ..add(VisitorsNew())
      ..add(Member())
      ..add(Personal());

    _iconColorList[_currentIndex] = Color.fromRGBO(249, 172, 56, 1);

    super.initState();
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/nav/icon_nav_visitors_today.png'),
              size: ScreenUtil.getInstance().setHeight(22),
              color: _iconColorList[0],
            ),
            title: Text('今日顾客', style: TextStyle(
              color: _textColor,
            ),)
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/nav/icon_nav_visitors_add.png'),
              size: ScreenUtil.getInstance().setHeight(22),
              color: _iconColorList[1],
            ),
            title: Text('今日新客', style: TextStyle(
              color: _textColor,
            ),)
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/nav/icon_nav_member.png'),
                size: ScreenUtil.getInstance().setHeight(22),
                color: _iconColorList[2],
              ),
              title: Text('我的会员', style: TextStyle(
                color: _textColor,
              ),)
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/nav/icon_nav_person.png'),
                size: ScreenUtil.getInstance().setHeight(22),
                color: _iconColorList[3],
              ),
              title: Text('个人中心', style: TextStyle(
                color: _textColor,
              ),)
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            // 修改 nav icon 颜色
            _iconColorList[_currentIndex] = Color.fromRGBO(159, 159, 159, 1);
            _iconColorList[index] = Color.fromRGBO(249, 172, 56, 1);

            _currentIndex = index;
          });
        },
      ),
    );
  }
}