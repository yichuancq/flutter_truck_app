import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_truck_app/model/stationdto.dart';
import 'package:flutter_truck_app/vo/stationvo.dart';

/// StationListPage
class StationListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StationListPageState();
  }
}

class StationListPageState extends State<StationListPage> {
  //自定义一个数据集合
  List<StationDto> stationList = [];

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
    stationList = null;
    _easyRefreshKey = null;
    _headerKey = null;
    print("on dispose...");
  }

  void loadData() async {
    //读取json
    List<StationDto> stations = await decodeFromDTO();
//    print("list size: ${stations.length}");
    stationList = stations;
    //更新列表
    setState(() {
      //状态
    });
  }

  //构造item
  Widget buildRow(final int position) {
    StationDto stationDto = stationList[position];

    ///ListTile布局
    return new ListTile(
      onTap: () {},
      title: Text(
        stationDto.zDCode,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      // 自定义样式
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(stationDto.zDName,
              style: TextStyle(color: Colors.black, fontSize: 15)),
          Text(stationDto.xLCode + " , " + stationDto.xLName,
              style: TextStyle(color: Colors.black, fontSize: 13)),
          Text("创建时间:" + stationDto.createDate,
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
//      child:Padding(padding: EdgeInsets.all(5.0), child: buildViewCard(position)),
      child: Padding(padding: EdgeInsets.all(5.0), child: buildRow(position)),
    );
  }

//  Widget buildViewCard(final int position) {
//    StationDto stationDto = stationList[position];
//
//    /// 卡片布局
//    return new Card(
//      elevation: 2,
//      margin: EdgeInsets.all(2),
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new Text(
//            "站点编码:" + stationDto.zDCode,
//            style: TextStyle(color: Colors.green),
//          ),
//          new Text("站点名称:" + stationDto.zDName),
//          new Text("" + stationDto.createDate),
//        ],
//      ),
//    );
//  }

  //实现构建方法
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
            itemCount: stationList.length,
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
//      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("站点信息", style: TextStyle(fontSize: 15)),
      ),
      body: viewBuild(),
    );
  }
}
