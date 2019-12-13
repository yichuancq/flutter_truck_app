import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_truck_app/model/stationdto.dart';

///解析站点JSON为对象集合
Future<String> loadJsonFile() async {
  return await rootBundle.loadString('assets/station.json');
}

//http://111.17.167.148:8090/CarBaseInfo/Jcz/GetMoudleListJson?_search=false&nd=1576256915407&rows=1000&page=1&sidx=&sord=asc&parentid=&condition=ZDCode&keyword=GD308
///decodeFromDTO
//Future<StationDto> decodeFromDTO() async {
//  String jsonString = await loadJsonFile();
//
//  final jsonMap = json.decode(jsonString);
//  StationDto stationDto = StationDto.fromJson(jsonMap);
//  return stationDto;
//}
Future<List<StationDto>> decodeFromDTO() async {
  String jsonString = await loadJsonFile();
  List responseJson = json.decode(jsonString);
  List<StationDto> stationList =
      responseJson.map((m) => new StationDto.fromJson(m)).toList();
  return stationList;
}
