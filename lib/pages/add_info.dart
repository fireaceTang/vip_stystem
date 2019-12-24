import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vip_system/common/dialog.dart';
import 'package:vip_system/model/request_model.dart';
import 'package:vip_system/model/vipAdd.dart';
import 'package:vip_system/utils/request.dart';

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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;
  Map _userInfo; // 用户信息

  int _pickerIndex;
  int _selectIndex;
  int _pickerIndex_1;
  int _selectIndex_1;
  int _unitId; // 公司id
  List<dynamic> _userLevel;
  List<dynamic> _deviceList;
  List<Widget> _pickerLevel = new List<Widget>();
  List<Widget> _pickerDevice = new List<Widget>();

  // vip 新增
  VipAdd _vip = VipAdd();
  bool _isShowToast = false; // 用于保证每次弹窗只有一个

  Request _request = Request();
  
  Future<SharedPreferences> _share = SharedPreferences.getInstance();

  // 获取用户等级
  Future<ResponseModel> _getLevelList() async {
    return await _request.get(
      '/app/label/list',
      data: {
        'unitId': _unitId,
      }
    );
  }

  // 设备列表
  Future<ResponseModel> _getDeviceList() async {
    return await _request.get(
      '/app/face/deviceList',
      data: null
    );
  }

  Future<ResponseModel> _addVip() async {
    return await _request.post(
      '/app/face/addVip',
      data: _vip.toJson()
    );
  }

  // 相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      handleData(image);
    }
  }

  // 调用图片上传
  void handleData(File image) {
    // loading 弹窗
    ProgressDialog.showProgress(context,
      child: SpinKitFadingCircle(
        color: Colors.white,
        duration: Duration(seconds: 10),
      ),
    );
    _imageUpload(image.path).then((result) {
//      String _cacheUrl = result.data[0];
      if (result.code == 200) {
        _vip.avatar = result.data[0];
        _image = image;
        image = null;
        ProgressDialog.dismiss(context); // 关闭 loading
      }
    });
  }

  // 图片上传
  Future<ResponseModel> _imageUpload (imageUrl) async {
    return await _request.upload(
      '/web/upload/img',
      FormData.fromMap({
        'request': MultipartFile.fromFileSync(imageUrl),
      }),
    );
  }

  @override
  void initState() {
    super.initState();

    _share.then((share) {
      setState(() {
        _userInfo = json.decode(share.getString('userInfo'));
        _unitId = _userInfo['unitId'];
        _vip.userId = _userInfo['id'];
        _vip.unitId = _unitId;

        // 用户属性，下拉列表
        _getLevelList().then((result) {
          print(result);
          if (result.code == 200) {
            setState(() {
              _userLevel = result.data;

              // 遍历添加下拉选择框
              _userLevel.forEach((item) {
                _pickerLevel.add(
                  Container(
                    height: ScreenUtil.getInstance().setHeight(50),
                    child: Center(
                      child: Text(item['labelName'], style: _textStyle,),
                    ),
                  ),
                );
              });
            });
          }
        });

        // 设备列表
        _getDeviceList().then((result) {
          if (result.code == 200) {
            setState(() {
              print(result);
              _deviceList = result.data;

              // 遍历添加下拉选择框
              _deviceList.forEach((item) {
                _pickerDevice.add(
                  Container(
                    height: ScreenUtil.getInstance().setHeight(50),
                    child: Center(
                      child: Text(item['name'], style: _textStyle,),
                    ),
                  ),
                );
              });
            });
          }
        });

      });
    });
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
                                    color: Color.fromRGBO(245, 246, 246, 1),
                                  ),
                                ),
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
                                  color: Color.fromRGBO(245, 246, 246, 1),
                                ),
                              ),
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
                                    onSaved: (name) {
                                      setState(() {
                                        if (name.isEmpty) {
                                          if (!_isShowToast) {
                                            Fluttertoast.showToast(msg: '姓名不能为空');
                                            _isShowToast = true;
                                          }
                                        } else {
                                          _vip.vipName = name;
                                          _isShowToast = false;
                                        }
                                      });
                                    },
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
                                    onSaved: (telephone) {
                                      setState(() {
                                        if (telephone.isEmpty) {
                                          if (!_isShowToast) {
                                            Fluttertoast.showToast(msg: '联系电话不能为空');
                                            _isShowToast = true;
                                          }
                                        } else {
                                          _vip.telephone = telephone;
                                          _isShowToast = false;
                                        }
                                      });
                                    },
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
                                    height: ScreenUtil.getInstance().setHeight(60),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setHeight(15), 0, ScreenUtil.getInstance().setHeight(15)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(_selectIndex != null ? _userLevel[_selectIndex]['labelName'] : '请选择会员等级',
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
                                        children: _pickerLevel,
                                        onSelectedItemChanged: (index) {
                                          print(index);
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
                                          _selectIndex = 0;
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
                          GestureDetector(
                            child: Container(
                              height: ScreenUtil.getInstance().setHeight(68),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('设备', style: _textStyle),
                                  Container(
                                    width: ScreenUtil.getInstance().setWidth(135),
                                    height: ScreenUtil.getInstance().setHeight(60),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setHeight(15), 0, ScreenUtil.getInstance().setHeight(15)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(_selectIndex_1 != null ? _deviceList[_selectIndex_1]['name'] : '请选择设备',
                                          style: _selectIndex_1 != null ? _textStyle : TextStyle(
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
                                        children: _pickerDevice,
                                        onSelectedItemChanged: (index) {
                                          print(index);
                                          setState(() {
                                            _pickerIndex_1 = index;
                                          });
                                        },
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (_pickerIndex_1 == null) {
                                          _pickerIndex_1 = 0;
                                          _selectIndex_1 = 0;
                                        } else {
                                          _selectIndex_1 = _pickerIndex_1;
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
                              top: ScreenUtil.getInstance().setHeight(10),
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
                              onSaved: (content) {
                                setState(() {
                                  if (content.isEmpty) {
                                    if (!_isShowToast) {
                                      Fluttertoast.showToast(msg: '备注不能为空');
                                      _isShowToast = true;
                                    }
                                  } else {
                                    _vip.content = content;
                                    _isShowToast = false;
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            child: Container(
                              width: ScreenUtil.getInstance().setWidth(336),
                              height: ScreenUtil.getInstance().setHeight(40),
                              margin: EdgeInsets.fromLTRB(
                                0, ScreenUtil.getInstance().setHeight(28),
                                0, ScreenUtil.getInstance().setHeight(28),
                              ),
                              child: FlatButton(
                                color: Color.fromRGBO(255, 164, 6, 1),
                                child: Text('保 存', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.getInstance().setSp(14)
                                ),),
                                onPressed: () {
                                  _formKey.currentState.save();

                                  setState(() {
                                    if (_image == null) {
                                      if (!_isShowToast) {
                                        Fluttertoast.showToast(msg: '头像不能为空');
                                        _isShowToast = true;
                                      }
                                    }

                                    if (_selectIndex == null) {
                                      if (!_isShowToast) {
                                        Fluttertoast.showToast(msg: '用户属性不能为空');
                                        _isShowToast = true;
                                      }
                                    } else {
                                      _vip.labelId = _userLevel[_selectIndex]['id'];
                                      _isShowToast = false;
                                    }

                                    if (_selectIndex_1 == null) {
                                      if (!_isShowToast) {
                                        Fluttertoast.showToast(msg: '设备不能为空');
                                        _isShowToast = true;
                                      }
                                    } else {
                                      _vip.uuid = _deviceList[_selectIndex_1]['equipmentId'];
                                      _isShowToast = false;
                                    }

                                    if (!_isShowToast) {
                                      _addVip().then((result) {
                                        if (result.code == 200) {
                                          Fluttertoast.showToast(msg: '成功');
                                          Navigator.pop(context);
                                        }
                                      });
                                    }
                                  });
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