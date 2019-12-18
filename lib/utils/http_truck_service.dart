import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_truck_app/model/struckitemdto.dart';
import 'package:flutter_truck_app/model/truckdto.dart';

Future<void> doGet() async {}

//delete line -> cmd+delete
final String cookie = "";
/// 获取网络数据
Future<TruckDto> getTruckDtoHttp() async {
  try {
    Map<String, dynamic> headers = new Map();
    headers['Cookie'] = cookie;
    Options options = new Options(headers: headers);
    final String url =
        "http://111.17.167.148:8090/CarBaseInfo/CurrentReflesh/GetPageListJson?queryJson=%7B%22isOver%22%3A1%2C%22StartTime%22%3A%222019-11-18%22%2C%22EndTime%22%3A%222019-12-18%22%2C%22DD%22%3A%22%22%2C%22CPH%22%3A%22%22%7D&_search=false&nd=1576599306995&rows=50&page=1&sidx=XH&sord=desc";
    Response response = await Dio().get(url, options: options);
    if (response.statusCode == 200) {
      print(response.request.uri);
      String result = response.data.toString();
//      print(result);
      final jsonMap = json.decode(result);
      return TruckDto.fromJson(jsonMap);
    }
  } catch (e) {
    print(e);
  }
}

/// item
Future<TruckItemDto> getTruckItemDtoHttp(int orderNumber) async {
  try {
    Map<String, dynamic> headers = new Map();
    headers['Cookie'] = cookie;
    Options options = new Options(headers: headers);
    final String url =
        "http://111.17.167.148:8090/CarBaseInfo/Search/GetPageEntityJson?XH=${orderNumber}";
    Response response = await Dio().get(url, options: options);
    if (response.statusCode == 200) {
      print(response.request.uri);
      String result = response.data.toString();
//      print(result);
      final jsonMap = json.decode(result);
      return TruckItemDto.fromJson(jsonMap);
    }
  } catch (e) {
    print(e);
  }
}

///down file
void downloadFile(final String downloadUrl, final String savePath) async {
  try {
    Dio dio = Dio();
    Map<String, dynamic> headers = new Map();
    headers['Cookie'] = cookie;
    Options options = new Options(headers: headers);
    //设置连接超时时间
    dio.options.connectTimeout = 10000;
    //设置数据接收超时时间
    dio.options.receiveTimeout = 10000;
    Response response = await dio.download(downloadUrl, savePath,
        options: options, onReceiveProgress: (received, total) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    });
    if (response.statusCode == 200) {
      print('下载请求成功');
    }
  } catch (e) {
    print(e);
  }
}

//http://111.17.167.148:8090/CarBaseInfo/Search/punishfrom?keyValue=%u9C81PM5257&xhValue=14017390&DD=&StartTime=&EndTime=&CPH=&CXL=&ZS=&FX=&CD=&CLBS=&ZZ=&isOver=1&scbz=0
//http://111.17.167.148:8090/CarBaseInfo/Search/punishfrom?keyValue=%u9C81PM5257&xhValue=14017390&DD=&StartTime=&EndTime=&CPH=&CXL=&ZS=&FX=&CD=&CLBS=&ZZ=&isOver=1&scbz=0
// item info
//http://111.17.167.148:8090/CarBaseInfo/Search/GetPageEntityJson?XH=14017390
//cp
//http://111.17.167.148:8090/Plate/GD309/OverWeight/20191218024751%E9%B2%81PM5257-1~.jpg
//http://111.17.167.148:8090/Plate/GD309/OverWeight/20191218024751%E9%B2%81PM5257-3.jpg
//http://111.17.167.148:8090/Plate/GD309/OverWeight/20191218024751%E9%B2%81PM5257-2.jpg
//http://111.17.167.148:8090/Plate/GD309/OverWeight/20191218024751%E9%B2%81PM5257-1~.jpg
