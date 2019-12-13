import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'download.dart';

class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State {
  final Color _textColor = Color.fromRGBO(51, 51, 51, 1);
  final TextStyle _textStyle = TextStyle(
    color: Color.fromRGBO(51, 51, 51, 1),
    fontSize: ScreenUtil.getInstance().setSp(14),
  );

  PermissionStatus permission;

  bool _isGetLocation = false;
  bool _isGetPhotos = false;
  bool _isGetMsg = false;
  String _cacheSizeStr;


  @override
  void initState () {
    // 获取缓存大小
    loadCache();

    testing();
    super.initState();
  }

  void testing () async{
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    print(permission);
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
        title: Text('设置', style: TextStyle(
          color: _textColor,
          fontSize: ScreenUtil.getInstance().setSp(18),
        ),),
        backgroundColor: Color.fromRGBO(255, 235, 152, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), 0, ScreenUtil.getInstance().setWidth(15), 0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: ScreenUtil.getInstance().setHeight(10),
                    color: Color.fromRGBO(245, 246, 246, 1),
                  )
                )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.getInstance().setHeight(78),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('获取位置', style: _textStyle,),
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: _isGetLocation,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              setState(() {
                                _isGetLocation = value;
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('访问相册', style: _textStyle,),
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: _isGetPhotos,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              setState(() {
                                _isGetPhotos = value;
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('消息通知', style: _textStyle,),
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: _isGetMsg,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              setState(() {
                                _isGetMsg = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(15), 0, ScreenUtil.getInstance().setWidth(15), 0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: ScreenUtil.getInstance().setHeight(70),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('推荐下载', style: _textStyle,),
                          Icon(Icons.keyboard_arrow_right, color: _textColor,),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Download()));
                    },
                  ),
                  GestureDetector(
                    child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('清理缓存', style: _textStyle,),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(_cacheSizeStr),
                                Icon(Icons.keyboard_arrow_right, color: _textColor,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text( '提示'),
                            content: Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil.getInstance().setHeight(20),
                              ),
                              child: Text('是否确认要清理本地缓存数据？',
                                style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(14),
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text('取消'),
                                textStyle: TextStyle(fontSize: ScreenUtil.getInstance().setSp(18), color: Colors.blueAccent),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text('确认'),
                                textStyle: TextStyle(fontSize: ScreenUtil.getInstance().setSp(18), color: Colors.grey),
                                onPressed: () {
                                  _clearCache(); // 清理缓存
                                  loadCache(); // 重新获取缓存

                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 加载缓存
  Future<Null> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
    print('临时目录大小: ' + value.toString());
    setState(() {
      _cacheSizeStr = _renderSize(value);  // _cacheSizeStr用来存储大小的值
    });
  }

  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  void _clearCache() async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    await loadCache();
    Fluttertoast.showToast(msg: '清除缓存成功');
  }
  /// 递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }
}