import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Feedback extends StatefulWidget {
  @override
  FeedbackState createState() => FeedbackState();
}

class FeedbackState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final TextStyle _textStyle = TextStyle(
    color: Color.fromRGBO(51, 51, 51, 1),
    fontSize: ScreenUtil.getInstance().setSp(14),
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
        title: Text('问题反馈', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), ScreenUtil.getInstance().setHeight(9), ScreenUtil.getInstance().setWidth(15), 0),
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setWidth(345),
              height: ScreenUtil.getInstance().setHeight(200),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5))),
              ),
              child: TextField(
                style: _textStyle,
                maxLines: 15,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '请输入遇到的问题或建议～',
                  contentPadding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(10), ScreenUtil.getInstance().setHeight(5), ScreenUtil.getInstance().setWidth(10), ScreenUtil.getInstance().setHeight(5)),
                ),
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(336),
              height: ScreenUtil.getInstance().setHeight(42),
              margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(42),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5))),
              ),
              child: FlatButton(
                color: Color.fromRGBO(255, 164, 6, 1),
                child: Text('提交',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(16),
                    color: Colors.white
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}