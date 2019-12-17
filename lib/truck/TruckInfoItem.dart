import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_truck_app/model/truckdto.dart';
import 'package:flutter_truck_app/utils/http_truck_service.dart';
import 'dart:async';
import 'dart:convert';

/// 车辆实时数据item
class TruckInfoItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TruckInfoItemPageState();
  }
}

class TruckInfoItemPageState extends State<TruckInfoItemPage> {
  TruckDto _truckDto;

  Future<TruckDto> testNet() async {
    TruckDto dto = await getTruckDtoHttp();
    print("list size; ${dto.rows.length}");

    setState(() {});
    return dto;
  }

  Widget _content() {
    if (_truckDto == null) {
      return Text("hello");
    } else {
      return Container(

        child: Text("${_truckDto.rows.first.cX}"),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    testNet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("车辆实时数据明细", style: TextStyle(fontSize: 15)),
      ),
      body: _content(),
    );
  }
}
