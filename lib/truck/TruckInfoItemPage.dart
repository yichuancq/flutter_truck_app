import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 车辆实时数据item
class TruckInfoItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TruckInfoItemPageState();
  }
}

class TruckInfoItemPageState extends State<TruckInfoItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("车辆实时数据明细", style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
