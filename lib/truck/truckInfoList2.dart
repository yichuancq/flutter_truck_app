import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_truck_app/model/truckdto.dart';
import 'package:flutter_truck_app/vo/truckvo.dart';
/// 车辆实时数据
///
/// //子类别 default
int parentMId = 0;
Map<String, dynamic> subData;
int degreeType = 0;
int currentPage = 0; //第一页
List<Rows> _truckList = [];

class TruckInfoListPage extends StatefulWidget {
  static TruckInfoListPageState _infoListPageState;

//父菜单的Id
  final int parentMenuId;

  //子类别
  final dynamic data;

  const TruckInfoListPage({Key key, this.parentMenuId, this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState({Key key, data}) {
    _infoListPageState = new TruckInfoListPageState();
    if (parentMenuId != null && data != null) {
      parentMId = parentMenuId;
      subData = data;
    }
    setDegreeParams();
    return _infoListPageState;
  } //

  void setDegreeParams() {
    if (data != null && data['id'] != null) {
      degreeType = int.parse("${data['id']}");
    } else {
      degreeType = 4;
    }
    print("degreeType:$degreeType");
  }
//
//  ///筛选
//  void refreshListView() {
//    _infoListPageState.loadData();
//  }
}

class TruckInfoListPageState extends State<TruckInfoListPage>
    with AutomaticKeepAliveClientMixin {
  //自定义一个数据集合

  TruckInfoListPageState();

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
    _truckList.clear();
    _easyRefreshKey = null;
    _headerKey = null;
    print("on dispose...");
  }

//  /// 刷新列表
//  void refresh(dynamic data) async {
//    //
//
//    print("list data: ${data}");
//    print("reresh...");
//
//
//  //  new ReloadData().loadData();
////    loadData();
////    Map<String, dynamic> map = data;
////    var flag = map.containsKey("title");
////    print(flag);
//    /// 解析KEY的值
//    if (data != null && data['title'] != null) {
//      print("menu key is:" + data['title']);
//    }
//    print("list size: ${_truckList.length}");
//    _truckList.forEach((element) {
//      //遍历每个元素  此时不可add或remove  否则报错 但可以修改元素值
//      print(element.dD);
//    });
//    var key = data['title'];
//
//    ///ZDCode
//    var whereList = _truckList.where((element) => element.dD == key).toList();
//    print("过滤后的集合大小 :${whereList.length}");
//
//    _truckList.clear();
//    _truckList.addAll(whereList);
//    setState(() {
//      print("flter...");
//    });
//  }

  ///
  void loadData() async {
    //读取json
    TruckDto truckDto = await decodeFromDTO();
    _truckList = truckDto.rows;
    if (subData != null && subData['title'] != null) {
      print("menu key is:" + subData['title']);
      var key = subData['title'];
      ///ZDCode
      var whereList = _truckList.where((element) => element.dD == key).toList();
      print("过滤后的集合大小 :${whereList.length}");
      _truckList.clear();
      _truckList = whereList;
    } else {
      _truckList = truckDto.rows;
    }
    print("list size: ${_truckList.length}");
//    //更新列表
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 13)),
                      ),

                      Expanded(
                        flex: 1,
                        child: Text("轴数 : ${dto.zS} , 超限:${dto.cX} kg",
                            style:
                                TextStyle(color: Colors.black, fontSize: 13)),
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
        print("click item index=$position");
      },
      child: new Card(
        child: row,
      ),
    );
  }

  //构造数据
  getRowData(int position) {
    return GestureDetector(
      //buildRows
      child: Padding(padding: EdgeInsets.all(2.0), child: buildRows(position)),
    );
  }

  Widget _viewBuild() {
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
//    body: viewBuild(),
      body: new SafeArea(child: _viewBuild()),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

////
class ReloadData extends StatelessWidget {
  //callback
  @required
  VoidCallback onPress;

  void action() {
    print('action');
  }

  void loadData() async {
    //读取json
    TruckDto truckDto = await decodeFromDTO();
    _truckList = truckDto.rows;
//    print("list size: ${_truckList.length}");
  }

  @override
  Widget build(BuildContext context) {
    ///
    ///
    ///
    return null;
  }
}
