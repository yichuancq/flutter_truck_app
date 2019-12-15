////import 'package:amap_base/amap_base.dart';
//import 'package:amap_base_map/amap_base_map.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_truck_app/model/stationdto.dart';
//
///// 站点详情信息
//class StationDetailPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return StationDetailPageState();
//  }
//}
//
//class StationDetailPageState extends State<StationDetailPage>
//    with AutomaticKeepAliveClientMixin {
//  StationDto _stationDto;
//
////  @override
////  bool get wantKeepAlive => true;
//
//  //地图到控制器
//  AMapController _controller;
//
//
////  @override
////  bool get wantKeepAlive {}
//
//  /// 添加覆盖物
//  Widget _addMark() {
//    ///// Marker覆盖物的位置坐标 [Android, iOS]
//    _controller.addMarker(new MarkerOptions(
//      highlighted: true,
//      enabled: false,
//      //Marker覆盖物是否平贴地图
//      isFlat: false,
//      //Marker覆盖物的坐标是否是Gps
//      isGps: true,
//      position: LatLng(116.630000, 36.803002),
//    ));
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _controller = null;
//  }
//  ///mapView
//  Widget _mapView() {
//    return AMapView(
//      onAMapViewCreated: (controller) {
//        _controller = controller;
//        //添加覆盖物
//        _addMark();
//      },
//      amapOptions: AMapOptions(
//        scaleControlsEnabled: true,
//        rotateGesturesEnabled: true,
//        zoomControlsEnabled: true,
//        //是否启动显示定位蓝点, 默认false
//        myLocationEnabled: true,
//        compassEnabled: true,
//        logoPosition: LOGO_POSITION_BOTTOM_CENTER,
//        camera: CameraPosition(
//          target: LatLng(116.630000, 36.803002),
//          zoom: 5,
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text("站点详情信息", style: TextStyle(fontSize: 15)),
//      ),
//      body: MapPage(),
//    );
//  }
//
//
//  @override
//  // TODO: implement wantKeepAlive
//  bool get wantKeepAlive => false;
//}