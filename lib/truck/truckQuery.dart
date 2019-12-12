import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 车辆查询
class TruckQueryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TruckQueryPageState();
  }
}

class TruckQueryPageState extends State<TruckQueryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("车辆查询", style: TextStyle(fontSize: 15)),
//        title: new Text("检车数据"),
      ),
    );
  }
}
