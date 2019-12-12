import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 报表统计
class ReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReportPageState();
  }
}

class ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("报表统计", style: TextStyle(fontSize: 15)),
//        title: new Text("检车数据"),
      ),
    );
  }
}
