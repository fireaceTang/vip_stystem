import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Nickname extends StatefulWidget {
  Nickname({
      Key key,
      @required this.nickname,
  }) : super(key: key);
  final String nickname;

  @override
  NicknameState createState() => NicknameState(nickname);
}

class NicknameState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final TextEditingController _controller = TextEditingController();
  String _nickname;

  NicknameState(nickname) {
    _nickname = nickname;
  }

  @override
  void initState() {
    // 设置初始默认值
    _controller.value = TextEditingValue(
      text: _nickname
    );

    super.initState();
  }

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
        title: Text('设置昵称', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('保存',
                  style: TextStyle(
                    color: _textColor,
                    fontSize: ScreenUtil.getInstance().setSp(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        color: Color.fromRGBO(245, 246, 246, 1),
        padding: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(14),
        ),
        child: TextFormField(
          controller: _controller,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(14),
            color: _textColor,
          ),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            suffix: Container(
              width: ScreenUtil.getInstance().setHeight(16),
              height: ScreenUtil.getInstance().setHeight(16),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: ScreenUtil.getInstance().setHeight(12),
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}