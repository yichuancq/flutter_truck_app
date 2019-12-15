import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 站点详情信息
class StationDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StationDetailPageState();
  }
}

class StationDetailPageState extends State<StationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("站点详情信息", style: TextStyle(fontSize: 15)),
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.search),
//              tooltip: 'Search',
//              onPressed: () {
//                // do nothing
//              }),
//        ],
//        title: new Text("检车数据"),
      ),
    );
  }
}
