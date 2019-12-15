import 'package:amap_base_map/amap_base_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_truck_app/model/stationdto.dart';

StationDto _stationDto;

///地图页面
class MapPage extends StatefulWidget {
  final StationDto stationDto;

  MapPage({Key key, this.stationDto}) : super(key: key);

  @override
  _MapPageState createState() {
    _stationDto = this.stationDto;
    return new _MapPageState();
  }
}

///
class _MapPageState<StationDto> extends State<MapPage>
    with AutomaticKeepAliveClientMixin {
  AMapController _controller;

  //  ///初始化
  @override
  void initState() {
    super.initState();
    if (_stationDto != null && _stationDto.target != null) {
//      print("target: " + _stationDto.target);
      var arr = _stationDto.target.split(",");
      print("经纬度:  ${arr[0]}   ${arr[1]} ");
    }
  }

  /// 添加覆盖物
  Widget _addMark() {
    if (_stationDto != null && _stationDto.target != null) {
      var arr = _stationDto.target.split(",");
      ///// Marker覆盖物的位置坐标 [Android, iOS]
      _controller.addMarker(new MarkerOptions(
        highlighted: true,
        enabled: false,
        //Marker覆盖物是否平贴地图
        isFlat: false,
        //Marker覆盖物的坐标是否是Gps
        isGps: true,
        position: LatLng(double.parse(arr[1]), double.parse(arr[0])),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller = null;
  }

  Widget _viewBuild() {
    return _mapView();
  }

  ///mapView
  Widget _mapView() {
    var arr = _stationDto.target.split(",");
    return AMapView(
      onAMapViewCreated: (controller) {
        _controller = controller;
        //添加覆盖物
        _addMark();
      },
      amapOptions: AMapOptions(
        scaleControlsEnabled: true,
        rotateGesturesEnabled: true,
        zoomControlsEnabled: true,
        //是否启动显示定位蓝点, 默认false
        myLocationEnabled: true,
        compassEnabled: true,
        logoPosition: LOGO_POSITION_BOTTOM_CENTER,
        camera: CameraPosition(
          target: LatLng(double.parse(arr[1]), double.parse(arr[0])),
          zoom: 9,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String title = "高德地图定位";
    //更新
    setState(() {
      //状态
    });
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title, style: TextStyle(fontSize: 15)),
        ),
        body: _viewBuild());
  }

  @override
  bool get wantKeepAlive => true;
}

// fix  source code  AddMarker class
//object OpenOfflineManager : MapMethodHandler {
//
//override fun with(map: AMap): MapMethodHandler {
//return this
//}
//
////报错代码注释
//override fun onMethodCall(methodCall: MethodCall, methodResult: MethodChannel.Result){
//}
////    override fun onMethodCall(p0: MethodCall?, p1: MethodChannel.Result?) {
////        registrar.activity().startActivity(
////                Intent(AMapBaseMapPlugin.registrar.activity(),
////                        OfflineMapActivity::class.java)
////        )
////    }
//}