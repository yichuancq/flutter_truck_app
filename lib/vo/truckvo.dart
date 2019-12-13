import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_truck_app/model/truckdto.dart';

///解析站点JSON为对象集合
Future<String> loadJsonFile() async {
  return await rootBundle.loadString('assets/truckinfo.json');
}

///
Future<TruckDto> decodeFromDTO() async {
  String jsonString = await loadJsonFile();
  final jsonMap = json.decode(jsonString);
  TruckDto truckDto = TruckDto.fromJson(jsonMap);
  return truckDto;
}