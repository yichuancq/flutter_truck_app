import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// DataListPage
class DataListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DataListPageState();
  }
}

class DataListPageState extends State<DataListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //设置没有返回按钮
        centerTitle: true,
        title: Text("检车数据", style: TextStyle(fontSize: 15)),
//        title: new Text("检车数据"),
      ),
    );
  }
}
