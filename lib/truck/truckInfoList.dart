import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_truck_app/model/truckdto.dart';
import 'package:flutter_truck_app/vo/truckvo.dart';

/// 车辆实时数据
class TruckInfoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TruckInfoListPageState();
  }
}

class TruckInfoListPageState extends State<TruckInfoListPage> {
  //自定义一个数据集合
  List<Rows> _truckList = [];

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();

  ///初始化
  @override
  void initState() {
    super.initState();
    loadData();
    print("on initState...");
  }

  ///释放
  @override
  void dispose() {
    super.dispose();
    _truckList = null;
    _easyRefreshKey = null;
    _headerKey = null;
    print("on dispose...");
  }

  void loadData() async {
    //读取json
    TruckDto truckDto = await decodeFromDTO();
    _truckList = truckDto.rows;
    print("list size: ${_truckList.length}");
    //更新列表
    setState(() {
      //状态
    });
  }

  //构造item
  Widget buildRow(final int position) {
    Rows dto = _truckList[position];

    ///ListTile布局
    return new ListTile(
      onTap: () {},
      title: Text("车牌号：${dto.cPH}",
          style: TextStyle(color: Colors.black, fontSize: 15)),
      // 自定义样式
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("线路: ${dto.dDN}",
              style: TextStyle(color: Colors.black, fontSize: 13)),
          //方向
          Text(
              "方向:${dto.fX} , 车道号:${dto.cD} , 轴数：${dto.zS}, 总重:${dto.zZ} kg"
              " \r\n速度:${dto.sD} km/h  ,超限率: ${dto.cXL}%",
              style: TextStyle(color: Colors.black, fontSize: 13)),
          //车道号
          // Text("车道号:${dto.cD}", style: TextStyle(color: Colors.black, fontSize: 13)),
          Text("超限:${dto.cX} kg",
              style: TextStyle(color: Colors.redAccent, fontSize: 13)),
          Text("检测时间 ${dto.jCSJ}",
              style: TextStyle(color: Colors.green, fontSize: 13)),
        ],
      ),
      //
      trailing: new Column(children: <Widget>[
        Expanded(
          child: new Container(child: new Icon(Icons.navigate_next)),
        ),
      ]),
    );
  }

  //构造数据
  getRowData(int position) {
    return GestureDetector(
      child: Padding(padding: EdgeInsets.all(5.0), child: buildRow(position)),
    );
  }

  viewBuild() {
    return Center(
      child: new EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: BezierCircleHeader(
          key: _headerKey,
          backgroundColor: Colors.white,
          color: Colors.green,
        ),
        child: new ListView.builder(
            //ListView的Item
            itemCount: _truckList.length,
            itemBuilder: (BuildContext context, int position) {
              return getRowData(position);
            }),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            setState(() {});
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("车辆实时数据", style: TextStyle(fontSize: 15)),
//        title: new Text("检车数据"),
      ),
      body: viewBuild(),
    );
  }
}
