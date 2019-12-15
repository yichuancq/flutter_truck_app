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

  Widget buildRows(final int position) {
    Rows dto = _truckList[position];
    var row = Container(
      margin: EdgeInsets.all(10.0), // 边界
//      padding: EdgeInsets.all(1.0), // 填充
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: Image.asset(
              "assets/image/check_station.png",
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            //设置弹性系数
//            flex: 1,
            child: Container(
                margin: EdgeInsets.only(left: 4.0, right: 4.0),
//            color: Colors.red,
                height: 130.0,
                child: Column(
//                  // 从左到右
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //内
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: new Row(
                              // 对齐方式
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("车牌号：",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                Text("${dto.cPH}"),
                                // myDegreeText(stationDto.degree),
                              ]),
                        ),
                      ),
                      //内嵌布局
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                              // 从左到右
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("线路：",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                Text("${dto.dDN}"),
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          //线路code和名称
                          child: Text(
                              "方向:${dto.fX} , 车道号:${dto.cD} , 轴数：${dto.zS},",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13),
                              softWrap: false, //文本是否能换行
                              maxLines: 4),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                            "总重:${dto.zZ} kg 速度:${dto.sD} km/h  ,超限率: ${dto.cXL} %",
                            style: TextStyle(color: Colors.black, fontSize: 13)),
                      ),

                      Expanded(
                        flex: 1,
                        child: Text("轴数 : ${dto.zS} , 超限:${dto.cX} kg",
                            style: TextStyle(color: Colors.black, fontSize: 13)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("检测时间 ${dto.jCSJ}",
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ),
                    ])),
          ),
          // 向右到箭头
          new Icon(Icons.navigate_next),
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        // StationDto stationDto = stationList[position];
        //print("att -->${stationDto.target}");
        //监听点击事件
        print("click item index=$position");
        //跳转到详情页面
        //doNavigator(stationDto);
      },
      child: new Card(
        child: row,
      ),
    );
  }

  //构造item
//  Widget buildRow(final int position) {
//    Rows dto = _truckList[position];
//
//    ///ListTile布局
//    return new ListTile(
//      onTap: () {},
//      // leading: Icon(Icons.directions_bus),
//      title: Text("车牌号：${dto.cPH}",
//          style: TextStyle(color: Colors.black, fontSize: 15)),
//      // 自定义样式
//      subtitle: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Text("线路: ${dto.dDN}",
//              style: TextStyle(color: Colors.black, fontSize: 13)),
//          //方向
//          Text(
//              "方向:${dto.fX} , 车道号:${dto.cD} , 轴数：${dto.zS}, 总重:${dto.zZ} kg"
//              " \r\n速度:${dto.sD} km/h  ,超限率: ${dto.cXL}%",
//              style: TextStyle(color: Colors.black, fontSize: 13)),
//          //车道号
//          // Text("车道号:${dto.cD}", style: TextStyle(color: Colors.black, fontSize: 13)),
//          Text("超限:${dto.cX} kg",
//              style: TextStyle(color: Colors.redAccent, fontSize: 13)),
//          Text("检测时间 ${dto.jCSJ}",
//              style: TextStyle(color: Colors.green, fontSize: 13)),
//        ],
//      ),
//      //
//      trailing: new Column(children: <Widget>[
//        Expanded(
//          child: new Container(child: new Icon(Icons.navigate_next)),
//        ),
//      ]),
//    );
//  }

  //构造数据
  getRowData(int position) {
    return GestureDetector(
      //buildRows
//      child: Padding(padding: EdgeInsets.all(5.0), child: buildRow(position)),
      child: Padding(padding: EdgeInsets.all(2.0), child: buildRows(position)),
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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("车辆实时数据", style: TextStyle(fontSize: 15)),
//        title: new Text("检车数据"),
      ),
      body: viewBuild(),
    );
  }
}
