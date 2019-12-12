import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 车辆实时数据
class TruckInfoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TruckInfoListPageState();
  }
}

class TruckInfoListPageState extends State<TruckInfoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("车辆实时数据", style: TextStyle(fontSize: 15)),
//        title: new Text("检车数据"),
      ),
    );
  }
}
