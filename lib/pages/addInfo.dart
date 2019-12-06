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
  Color _textColor = Color.fromRGBO(42, 56, 85, 1);
  GlobalKey _formKey = GlobalKey<FormState>();
  File _image;

  List<DropdownMenuItem<String>> _sortItems = [
    DropdownMenuItem(child: Container(width: ScreenUtil.getInstance().setWidth(100), alignment:Alignment.centerRight, child:Text('青铜会员')), value: '1',),
    DropdownMenuItem(child: Container(width: ScreenUtil.getInstance().setWidth(100), alignment:Alignment.centerRight, child:Text('白银会员')), value: '2',),
    DropdownMenuItem(child: Container(width: ScreenUtil.getInstance().setWidth(100), alignment:Alignment.centerRight, child:Text('黄金会员')), value: '3',),
    DropdownMenuItem(child: Container(width: ScreenUtil.getInstance().setWidth(100), alignment:Alignment.centerRight, child:Text('铂金会员')), value: '4',),
  ];
  String _selectedSort;

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
            color: _textColor
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
                                  color: Color.fromRGBO(255, 247, 237, 1),
                                  width: ScreenUtil.getInstance().setWidth(15)
                              )
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setWidth(20), 0, ScreenUtil.getInstance().setWidth(15)),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(237, 237, 237, 1)
                                      )
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('照片', style: TextStyle(color: Colors.grey, height: 1),),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: _image == null
                                              ? AssetImage('assets/login_bg.png')
                                              : FileImage(_image),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: ScreenUtil.getInstance().setWidth(5)
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
                              print(111);
                              _getImageFromGallery();
                            },
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setWidth(5), 0, ScreenUtil.getInstance().setWidth(5)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(237, 237, 237, 1)
                                    )
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('姓名', style: TextStyle(color: Colors.grey, height: 1),),
                                Container(
                                  width: ScreenUtil.getInstance().setWidth(200),
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: '请输入姓名',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setWidth(5), 0, ScreenUtil.getInstance().setWidth(5)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(237, 237, 237, 1)
                                    )
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('联系电话', style: TextStyle(color: Colors.grey, height: 1),),
                                Container(
                                  width: ScreenUtil.getInstance().setWidth(200),
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: '请输入联系方式',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setWidth(5), 0, ScreenUtil.getInstance().setWidth(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('用户属性', style: TextStyle(color: Colors.grey, height: 1),),
                                  Container(
                                    width: ScreenUtil.getInstance().setWidth(135),
                                    height: ScreenUtil.getInstance().setHeight(50),
                                    padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setWidth(10), 0, ScreenUtil.getInstance().setWidth(10)),
                                    child: DropdownButtonFormField(
                                      value: _selectedSort,
                                      items: _sortItems,
                                      decoration: InputDecoration.collapsed(
                                        hintText: '请选择会员等级',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedSort = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), ScreenUtil.getInstance().setWidth(30), ScreenUtil.getInstance().setWidth(15), 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text('备注', style: TextStyle(color: Colors.grey, height: 1),),
                          ),
                          Container(
                            height: ScreenUtil.getInstance().setHeight(180),
                            margin: EdgeInsets.only(
                                top: ScreenUtil.getInstance().setWidth(15)
                            ),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(233, 233, 233, 1),
                                  )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(233, 233, 233, 1),
                                    )
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              color: Colors.orange,
                              padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(120), ScreenUtil.getInstance().setWidth(10), ScreenUtil.getInstance().setWidth(120), ScreenUtil.getInstance().setWidth(10)),
                              child: Text('保存', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil.getInstance().setSp(18)
                              ),),
                              onPressed: () {
                                Navigator.pop(context);
                              },
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