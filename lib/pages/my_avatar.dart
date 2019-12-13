import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyAvatar extends StatefulWidget {
  MyAvatar({
    Key key,
    @required this.avatar,
  }) : super(key: key);
  final String avatar;

  @override
  MyAvatarState createState() => MyAvatarState(avatar);
}

class MyAvatarState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  TextStyle _textStyle = TextStyle(
    fontSize: ScreenUtil.getInstance().setSp(14),
    color: Color.fromRGBO(51, 51, 51, 1),
  );
  String _avatar;
  File _image;

  // 传参
  MyAvatarState (String avatar) {
    print(avatar);
    _avatar = avatar;
  }

  //拍照
  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  // 相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

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
        title: Text('个人头像', style: TextStyle(
            color: _textColor
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Image(
                image: _image != null ? FileImage(_image) : NetworkImage(_avatar != null ? _avatar : ''),
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.getInstance().setHeight(340),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(304),
              height: ScreenUtil.getInstance().setHeight(40),
              margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(61),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(216, 216, 216, 1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5)))
              ),
              child: FlatButton(
                child: Text('从相册选一张', style: _textStyle,),
                onPressed: () {
                  print('1231312');
                  _getImageFromGallery();
                },
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(304),
              height: ScreenUtil.getInstance().setHeight(40),
              margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(22),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(216, 216, 216, 1),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setWidth(5)))
              ),
              child: FlatButton(
                child: Text('拍一张照片', style: _textStyle,),
                onPressed: () {
                  _getImageFromCamera();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}