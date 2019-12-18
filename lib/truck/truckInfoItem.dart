import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_truck_app/model/struckitemdto.dart';
import 'package:flutter_truck_app/utils/http_truck_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:permission_handler/permission_handler.dart';

/// 车辆实时数据item
int queryNumber = 0;

class TruckInfoItemPage extends StatefulWidget {
  //序号
  final int orderNumber;

  const TruckInfoItemPage({Key key, this.orderNumber}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    queryNumber = this.orderNumber;
    print("orderNumber =${orderNumber}");
    return TruckInfoItemPageState();
  }
}

class TruckInfoItemPageState extends State<TruckInfoItemPage> {
  TruckItemDto _truckDto;
  dynamic size = 0;
  dynamic width = 0;
  dynamic height = 0;
  double process = 0.0; // 下载到进度
  bool _isShowing = false; // 下载进度条显示

  ///初始化
  @override
  void initState() {
    loadData();
    print("on initState...");
    super.initState();
    setState(() {});
  }

  void loadData() async {
    TruckItemDto itemDto = await getTruckItemDtoHttp(queryNumber);
    //更新列表
    setState(() {
      _truckDto = itemDto;
      print("number: ${_truckDto.number}");
      print("CPH: ${_truckDto.cPH}"); //PM5257
      print("jCSJ: ${_truckDto.jCSJ}"); //2019/12/18 2:47:51
      print("DD: ${_truckDto.dD}"); //GD309
      print("JCDH: ${_truckDto.jCDH}"); //371425022019121802475114017390
      print("jDZSBH: ${_truckDto.jDZSBH}"); //13-20185378
      print("DDN: ${_truckDto.dDN}"); //西颜村检测点
      print("FX: ${_truckDto.fX}"); //西往东
      print("CDH: ${_truckDto.cDH}"); //3
      //状态
    });
  }

  Widget _widgetCard() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: new Table(
          //设置每一列的宽度
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth(110.0),
            1: FixedColumnWidth(300.0),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: new TableBorder.all(width: 1.0, color: Colors.transparent),
          children: <TableRow>[
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('序号'),
                ),
                new TableCell(
                  child: new Text('${queryNumber}'),
                ),
              ],
            ),

            //车牌号码
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text(
                    '车牌号码',
                    style: (TextStyle(color: Colors.orange)),
                  ),
                ),
                new TableCell(
                  child: new Text('${_truckDto.cPH}'),
                ),
              ],
            ),

            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('检测单号'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.jCDH}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('检测设备编号'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.jCSBBH}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('检定证书编号'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.jDZSBH}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('检测时间'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.jCSJ}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('站点'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.dDN}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('检测设备编号'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.jCSBBH}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('点位'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.dW}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('线路'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.xL}'),
                ),
              ],
            ),
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text('检测方向'),
                ),
                new TableCell(
                  child: new Text('${_truckDto.fX}'),
                ),
              ],
            ),
            //超限率(%)
            new TableRow(
              children: <Widget>[
                new TableCell(
                  child: new Text(
                    '超限率(%)',
                    style: (TextStyle(color: Colors.red)),
                  ),
                ),
                new TableCell(
                  child: new Text('${_truckDto.cXL} %'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //下载文件
  void _downLoad(final String downloadUrl) async {
    _checkPermission();
    var savePath = "";
    try {
      ///storage/emulated/0/truck_1403068214030682_farPicBak.png
      var _localPath = "/storage/emulated/0";

      print("downloadUrl is :${downloadUrl}");
      final savedDir = Directory(_localPath);
      // 判断下载路径是否存在
      bool hasExisted = await savedDir.exists();
      print("hasExisted-->${hasExisted}");
      // 不存在就新建路径
      if (!hasExisted) {
        savedDir.create();
      }
      var picName = "${queryNumber}";
      if (downloadUrl.endsWith("-1.jpg")) {
        picName += picName + "_farPic";
      }
      if (downloadUrl.endsWith("-2.jpg")) {
        picName += picName + "_farPicBack";
      }
      if (downloadUrl.endsWith("-3.jpg")) {
        picName += picName + "_farPicBak";
      }
      print("picName:" + picName);
      savePath = _localPath + "/truck_" + picName + ".png";
      print("savePath:" + savePath);
      _downloadFile(downloadUrl, savePath);
    } catch (e) {
      print(e);
    }
  }

  ///down file
  void _downloadFile(final String downloadUrl, final String savePath) async {
    try {
      setState(() {
        _isShowing = true;
      });

      Dio dio = Dio();
      Map<String, dynamic> headers = new Map();
      headers['Cookie'] = cookie;
      Options options = new Options(headers: headers);
      //设置连接超时时间
      dio.options.connectTimeout = 10000;
      //设置数据接收超时时间
      dio.options.receiveTimeout = 10000;
      Response response = await dio.download(downloadUrl, savePath,
          options: options, onReceiveProgress: (received, total) {
        ///process
        setState(() {
          process = received / total;
        });
        // print((received / total * 100).toStringAsFixed(0) + "%");
      });

      if (response.statusCode == 200) {
        print('下载请求成功');
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isShowing = false;
      });
    }
  }

  void _downLoadImage(final String url) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return new CupertinoAlertDialog(
            content: new Text("下载选择图片？"),
            actions: <Widget>[
              new CupertinoDialogAction(
                child: new Text('取消'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              new CupertinoDialogAction(
                child: new Text('确定'),
                isDestructiveAction: true,
                onPressed: () {
                  // TODO
                  Navigator.of(context).pop();
                  _downLoad(url);
                },
              ),
            ],
          );
        });
  }

  // 申请权限
  Future<bool> _checkPermission() async {
    // 先对所在平台进行判断
    if (Theme.of(context).platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  /// _itemTruckBuilder
  Widget _itemTruckBuilder(String imgURL) {
    return Card(
      elevation: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(imgURL, width: 300, height: 200, fit: BoxFit.fill),
          MaterialButton(
            child: new Row(
              children: <Widget>[
                Icon(Icons.file_download),
                Text("下载"),
              ],
            ),
            onPressed: () {
              _downLoadImage(imgURL);
            },
          ),
        ],
      ),
    );
  }

  ///_truckImagesWidget
  Widget _truckImagesWidget() {
    try {
      if (_truckDto == null) {
        return Text("loading...");
      } else {
        final String url1 = "http://111.17.167.148:8090/${_truckDto.farPic}";
        final String url2 =
            "http://111.17.167.148:8090/${_truckDto.farPicBack}";
        final String url3 = "http://111.17.167.148:8090/${_truckDto.farPicBak}";
        return Container(
          height: 260,
//          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _itemTruckBuilder("${url1}"),
              _itemTruckBuilder("${url3}"),
              _itemTruckBuilder("${url2}"),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
      return Text("loading...");
    } finally {
      setState(() {
        //
      });
    }
  }

  Widget _bodyView() {
    if (_truckDto == null || queryNumber == null) {
      // 加载菊花
      return Center(
        child: CupertinoActivityIndicator(),
      );
      //return CupertinoActivityIndicator();
    } else {
      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          _widgetCard(),
          _truckImagesWidget(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("公路车辆超限行为凭证", style: TextStyle(fontSize: 15)),
      ),
      body: ModalProgressHUD(
        dismissible:false,
        progressIndicator: CircularProgressIndicator(
          value: process,
        ),
        child: _bodyView(),
        inAsyncCall: _isShowing,
      ), //_bodyView(),
    );
  }
}
