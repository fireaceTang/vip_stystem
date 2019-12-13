import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override

  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State {
  Timer _countdownTimer;
  int _initDownNum = 3000;
  int _countdownNum = 3000;

  void reGetCountdown () {
    _countdownTimer = Timer.periodic(Duration(microseconds: 1000), (timer) {
      setState(() {
        if (_countdownNum > 0) {
          _countdownNum --;
        } else {
          _countdownTimer.cancel();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
        }
      });
    });
  }

  @override
  void initState(){
    reGetCountdown();
    super.initState();
  }

  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);

    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: ScreenUtil.screenHeight,
          height: ScreenUtil.screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/splash_screen.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: ScreenUtil.getInstance().setHeight(15.5),
                right: ScreenUtil.getInstance().setWidth(19.5),
                child: SizedBox(
                  width: ScreenUtil.getInstance().setWidth(45.5),
                  height: ScreenUtil.getInstance().setWidth(45.5),
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    value: (_initDownNum - _countdownNum) / _initDownNum,
                  ),
                ),
              ),
              Positioned(
                top: ScreenUtil.getInstance().setHeight(15.5),
                right: ScreenUtil.getInstance().setWidth(19.5),
                child: GestureDetector(
                  child: Container(
                    width: ScreenUtil.getInstance().setWidth(45.5),
                    height: ScreenUtil.getInstance().setWidth(45.5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 166, 48, 0.93),
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(45.5))),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('跳过',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.getInstance().setSp(12),
                          ),
                        ),
                        Text(((_countdownNum ~/ 1000) + 1).toString() + 'S',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.getInstance().setSp(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _countdownTimer.cancel();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
