import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// StationListPage
class StationListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StationListPageState();
  }
}

class StationListPageState extends State<StationListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("站点信息", style: TextStyle(fontSize: 15)),
//        title: new Text("检车数据"),
      ),
    );
  }
}
