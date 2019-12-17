import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_truck_app/model/truckdto.dart';
import 'package:flutter_truck_app/truck/TruckInfoItem.dart';
import 'package:flutter_truck_app/utils/http_truck_service.dart';
import 'package:flutter_truck_app/vo/truckvo.dart';

/// 车辆实时数据
class TruckInfoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TruckInfoListPageState();
  }
}

//http://111.17.167.148:8090/CarBaseInfo/CurrentReflesh/GetPageListJson?queryJson=%7B%22isOver%22%3A1%2C%22StartTime%22%3A%222019-11-18%22%2C%22EndTime%22%3A%222019-12-18%22%2C%22DD%22%3A%22%22%2C%22CPH%22%3A%22%22%7D&_search=false&nd=1576599306995&rows=15&page=1&sidx=XH&sord=desc
class TruckInfoListPageState extends State<TruckInfoListPage> {
  bool switchValue = true;
  String _newValue = 'GD308';
  double _sliderValue = 30;

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
    TruckDto truckDto = await getTruckDtoHttp();
    if (truckDto == null) {
      truckDto = await decodeFromDTO();
    }
    //读取json
//    TruckDto
    _truckList = truckDto.rows;
    print("list size: ${_truckList.length}");
    //更新列表
    setState(() {
      //状态
    });
  }

  Future<TruckDto> testNet() async {
    TruckDto dto = await getTruckDtoHttp();
    print("list size; ${dto.rows.length}");

    setState(() {});
    return dto;
  }

  void reLoadData() async {
    print("on reLoadData...");
    //读取json
    TruckDto truckDto = await getTruckDtoHttp();
//    TruckDto truckDto = await decodeFromDTO();
    _truckList = truckDto.rows;
    print("list size: ${_truckList.length}");

    //    ///ZDCode
    var whereList =
        _truckList.where((element) => element.dD == _newValue).toList();
    print("过滤后的集合大小 :${whereList.length}");
    _truckList.clear();
    _truckList.addAll(whereList);
    //更新列表
    setState(() {
      //状态
    });
  }

  ///
  Widget _rowHeader(Rows dataItem) {
    MaterialColor materialColor = Colors.green;
    if (dataItem != null) {
      if (dataItem.cXL > 100.00) {
        materialColor = Colors.red;
      } else {
        materialColor = Colors.grey;
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(2.0),
      child: new Icon(
        Icons.directions_car,
        color: materialColor,
      ),
    );
  }

  Widget buildRows(final int position) {
    Rows dto = _truckList[position];
    var row = Container(
      margin: EdgeInsets.all(10.0), // 边界
      child: Row(
        children: <Widget>[
          _rowHeader(dto),
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
        doNavigator(dto);
        print("click item index=$position");
      },
      child: new Card(
        child: row,
      ),
    );
  }

  //
  void doNavigator(final Rows dto) {
    if (dto == null) {
      return;
    }
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new TruckInfoItemPage(orderNumber: dto.xH);
    }));
    print("车辆实时数据item..");
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

  ///
  Widget _radioListTileBuilder(String text, StateSetter setBottomSheetState) {
    return new RadioListTile(
      secondary: const Icon(
        Icons.home,
        size: 18,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
      value: text,
      groupValue: _newValue,
      onChanged: (value) {
        //
        setBottomSheetState(() {
          _newValue = value;
          print("_newValue =" + _newValue);
        });
      },
    );
  }

  ///
  Future _myModalBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        // 圆角
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              //在这里为了区分，在构建builder的时候将setState方法命名为了setBottomSheetState。
              builder: (context, setBottomSheetState) {
            return Container(
              height: 480,
              child: Column(
                children: <Widget>[
                  _radioListTileBuilder("GD308", setBottomSheetState),
                  _radioListTileBuilder("GD309", setBottomSheetState),
                  _radioListTileBuilder("HJL01", setBottomSheetState),
                  _radioListTileBuilder("S105NB", setBottomSheetState),
                  _radioListTileBuilder("S105BN", setBottomSheetState),
                  new ListTile(
                    onTap: () {
                      setBottomSheetState(() {});
                      switchValue = !switchValue;
                    },
                    title: Text("自动刷新？${switchValue ? "Yes" : "No"}"),
                    trailing: Switch.adaptive(
                        value: switchValue,
                        onChanged: (val) {
                          setBottomSheetState(() {
                            switchValue = val;
                          });
                        }),
                  ),
                  new Slider(
                    value: _sliderValue,
                    max: 100.0,
                    min: 0.0,
                    onChanged: (double val) {
                      setBottomSheetState(() {
                        this._sliderValue = val;
                      });
                    },
                  ),
                  new Text(
                    "数据自动更新间隔：${_sliderValue.toInt()} 秒",
                    textAlign: TextAlign.center,
                  ),
//
                  new ListTile(
                    title: Text('确定', textAlign: TextAlign.center),
                    onTap: () {
                      Navigator.pop(context, '确定');
                      reLoadData();
                    },
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: <Widget>[
          // 非隐藏的菜单
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'setting',
              onPressed: () {
                _myModalBottomSheet();
                // open dialog
              }),
        ],
        centerTitle: true,
        title:
            Text("车辆实时数据${_truckList.length}条", style: TextStyle(fontSize: 15)),
      ),
//    body: viewBuild(),
      body: new SafeArea(child: _viewBuild()),
//       child: FooterAndScroll(),
    );
  }
}
