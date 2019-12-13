import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Download extends StatefulWidget {
  @override
  DownloadState createState() => DownloadState();
}

class DownloadState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final String _qrCode = 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3571247474,3876995370&fm=26&gp=0.jpg';

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
        title: Text('推荐下载', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: ScreenUtil.getInstance().setHeight(81),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.getInstance().setWidth(208),
                      height: ScreenUtil.getInstance().setWidth(208),
                      child: Image(image: NetworkImage(_qrCode)),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: ScreenUtil.getInstance().setHeight(48),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: ScreenUtil.getInstance().setWidth(55),
                              height: ScreenUtil.getInstance().setHeight(2),
                              color: Color.fromRGBO(153, 153, 153, 1),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(13), 0, ScreenUtil.getInstance().setWidth(13), 0),
                          child: Text('更多分享方式',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(12),
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: ScreenUtil.getInstance().setWidth(55),
                              height: ScreenUtil.getInstance().setHeight(2),
                              color: Color.fromRGBO(153, 153, 153, 1),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(12),
                      ),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(45),
                              height: ScreenUtil.getInstance().setWidth(45),
                              child: Image.asset('images/wx.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {
                              print('微信');
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(45),
                              height: ScreenUtil.getInstance().setWidth(45),
                              margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(75), 0, ScreenUtil.getInstance().setWidth(75), 0),
                              child: Image.asset('images/wx_friend.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {
                              print('朋友圈');
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(45),
                              height: ScreenUtil.getInstance().setWidth(45),
                              child: Image.asset('images/qq.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {
                              print('QQ');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}