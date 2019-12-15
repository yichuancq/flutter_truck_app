import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_truck_app/model/stationdto.dart';
import 'package:flutter_truck_app/station/station.dart';
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

  ///构造数据
  getRowData(int position) {
    return GestureDetector(
//      child:Padding(padding: EdgeInsets.all(5.0), child: buildViewCard(position)),
      //卡片到外边距
      child: Padding(padding: EdgeInsets.all(2.0), child: buildRows(position)),
    );
  }

  ///跳转到下一页
  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      //跳转到下一页
      return new StationDetailPage();
    }));
  }

  Widget buildRows(final int position) {
    StationDto stationDto = stationList[position];
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              "assets/image/check_station.png",
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            //设置弹性系数
            flex: 10,
            child: Container(
                margin: EdgeInsets.only(left: 4.0, right: 4.0),
//            color: Colors.red,
                height: 90.0,
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
                                Text("站点编码：",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                Text("${stationDto.zDCode}"),
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
                                Text("站点名称：",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                Text("${stationDto.zDName}"),
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                              " ${stationDto.xLCode}, ${stationDto.xLName}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("创建时间 : ${stationDto.createDate}",
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
        //监听点击事件
        print("click item index=$position");
        //跳转到详情页面
        doNavigator();
      },
      child: new Card(
        child: row,
      ),
    );
  }

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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("站点信息", style: TextStyle(fontSize: 15)),
      ),
      body: viewBuild(),
    );
  }
}
