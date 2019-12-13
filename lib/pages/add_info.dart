import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddInfo extends StatefulWidget {
  @override

  AddInfoState createState() => AddInfoState();
}

class AddInfoState extends State<AddInfo> {
  Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  TextStyle _textStyle = TextStyle(
    fontSize: ScreenUtil.getInstance().setSp(14),
    color: Color.fromRGBO(102, 102, 102, 1),
  );

  GlobalKey _formKey = GlobalKey<FormState>();
  File _image;

  int _pickerIndex;
  int _selectIndex;
  List<String> _userLevel = [
    '青铜会员',
    '白银会员',
    '黄金会员',
    '铂金会员',
  ];
  List<Widget> _pickerItems = new List<Widget>();

  //拍照
  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);

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
  void initState() {
    setState(() {
      _userLevel.forEach((item) {
        _pickerItems.add(
          Container(
            height: ScreenUtil.getInstance().setHeight(40),
            child: Center(
              child: Text(item, style: _textStyle,),
            ),
          ),
        );
      });

      print(_pickerItems);
      print(_pickerItems.length);
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: Icon(Icons.arrow_back, color: _textColor,),
        ),
        title: Text('添加信息', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), 0, ScreenUtil.getInstance().setWidth(15), 0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(255, 248, 239, 1),
                                  width: ScreenUtil.getInstance().setWidth(10)
                              )
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: ScreenUtil.getInstance().setHeight(83),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(245, 246, 246, 1)
                                      )
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('照片', style: _textStyle),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: _image == null
                                              ? AssetImage('images/login_bg.png')
                                              : FileImage(_image),
                                          radius: ScreenUtil.getInstance().setWidth(30),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: ScreenUtil.getInstance().setWidth(10),
                                          ),
                                          child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: ScreenUtil.getInstance().setWidth(14),),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              _getImageFromGallery();
                            },
                          ),
                          Container(
                            height: ScreenUtil.getInstance().setHeight(68),
                            padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setWidth(5), 0, ScreenUtil.getInstance().setWidth(5)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(245, 246, 246, 1)
                                    )
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('姓名', style: _textStyle),
                                Container(
                                  width: ScreenUtil.getInstance().setWidth(200),
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.text,
                                    style: _textStyle,
                                    decoration: InputDecoration(
                                      hintText: '请输入姓名',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        fontSize: ScreenUtil.getInstance().setSp(14),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: ScreenUtil.getInstance().setHeight(68),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(245, 246, 246, 1),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('联系电话', style: _textStyle),
                                Container(
                                  width: ScreenUtil.getInstance().setWidth(200),
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    style: _textStyle,
                                    decoration: InputDecoration(
                                      hintText: '请输入联系方式',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                        fontSize: ScreenUtil.getInstance().setSp(14),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: ScreenUtil.getInstance().setHeight(68),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('用户属性', style: _textStyle),
                                  Container(
                                    width: ScreenUtil.getInstance().setWidth(135),
                                    height: ScreenUtil.getInstance().setHeight(50),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setHeight(15), 0, ScreenUtil.getInstance().setHeight(15)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(_selectIndex != null ? _userLevel[_selectIndex] : '请选择会员等级',
                                          style: _selectIndex != null ? _textStyle : TextStyle(
                                            color: Color.fromRGBO(153, 153, 153, 1),
                                            fontSize: ScreenUtil.getInstance().setSp(14),
                                          ),
                                        ),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    child: Container(
                                      height: ScreenUtil.getInstance().setHeight(160),
                                      child: CupertinoPicker(
                                        itemExtent: 40,
                                        backgroundColor: Colors.white,
                                        useMagnifier: true,
                                        children: _pickerItems,
                                        onSelectedItemChanged: (index) {
                                          setState(() {
                                            _pickerIndex = index;
                                          });
                                        },
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (_pickerIndex == null) {
                                          _pickerIndex = 0;
                                        } else {
                                          _selectIndex = _pickerIndex;
                                        }
                                      });
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), ScreenUtil.getInstance().setHeight(44), ScreenUtil.getInstance().setWidth(15), 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text('备注',
                              style: _textStyle,
                            ),
                          ),
                          Container(
                            height: ScreenUtil.getInstance().setHeight(127),
                            margin: EdgeInsets.only(
                              top: ScreenUtil.getInstance().setHeight(10)
                            ),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(221, 221, 221, 1),
                                  )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(221, 221, 221, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(336),
                              height: ScreenUtil.getInstance().setHeight(40),
                              margin: EdgeInsets.only(
                                top: ScreenUtil.getInstance().setHeight(28)
                              ),
                              child: FlatButton(
                                color: Color.fromRGBO(255, 164, 6, 1),
                                child: Text('保 存', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.getInstance().setSp(14)
                                ),),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}