import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'visitorsToday.dart';
import 'visitorsNew.dart';
import 'member.dart';
import 'personal.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State {
  int _currentIndex = 0;
  Color _textColor = Color.fromRGBO(42, 56, 85, 1);

  List<Widget> list = List();

  @override

  void initState() {
    list
      ..add(VisitorsToday())
      ..add(VisitorsNew())
      ..add(Member())
      ..add(Personal());
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
              AssetImage('images/icon_nav_visitors_today.png'),
              size: ScreenUtil.getInstance().setHeight(22),
              color: Colors.orange,
            ),
            title: Text('今日顾客', style: TextStyle(
              color: _textColor,
            ),)
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/icon_nav_visitors_add.png'),
              size: ScreenUtil.getInstance().setHeight(22),
              color: Colors.orange,
            ),
            title: Text('今日新客', style: TextStyle(
              color: _textColor,
            ),)
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/icon_nav_member.png'),
                size: ScreenUtil.getInstance().setHeight(22),
                color: Colors.orange,
              ),
              title: Text('我的会员', style: TextStyle(
                color: _textColor,
              ),)
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/icon_nav_person.png'),
                size: ScreenUtil.getInstance().setHeight(22),
                color: Colors.orange,
              ),
              title: Text('个人中心', style: TextStyle(
                color: _textColor,
              ),)
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}