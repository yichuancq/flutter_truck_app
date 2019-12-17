import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_truck_app/model/struckitemdto.dart';
import 'package:flutter_truck_app/utils/http_truck_service.dart';

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

//  ///
//  Future<TruckItemDto> testNet() async {
//    TruckItemDto dto = await getTruckItemDtoHttp(queryNumber);
//    print("${dto.toString()}");
//    print("number: ${dto.number}");
//    print("CPH: ${dto.cPH}"); //PM5257
//    print("jCSJ: ${dto.jCSJ}"); //2019/12/18 2:47:51
//    print("DD: ${dto.dD}"); //GD309
//    print("JCDH: ${dto.jCDH}"); //371425022019121802475114017390
//    print("jDZSBH: ${dto.jDZSBH}"); //13-20185378
//    print("DDN: ${dto.dDN}"); //西颜村检测点
//    print("FX: ${dto.fX}"); //西往东
//    print("CDH: ${dto.cDH}"); //3
//
//    setState(() {});
//    return dto;
//  }

  ///初始化
  @override
  void initState() {
    loadData();
    print("on initState...");
    super.initState();
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

  /// _itemTruckBuilder
  Widget _itemTruckBuilder(String imgURL, String name) {
    return Card(
      elevation: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(imgURL, width: 300, height: 200, fit: BoxFit.fill),
          Text(name,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)),
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
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _itemTruckBuilder("${url1}", "图片1"),
              _itemTruckBuilder("${url3}", "图片2"),
              _itemTruckBuilder("${url2}", "图片3"),
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
      return CupertinoActivityIndicator();
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
      body: _bodyView(),
    );
  }
}
