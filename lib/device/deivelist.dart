import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  @override
  ExpandableListState createState() => ExpandableListState();
}

class ExpandableListState extends State<ExpandableList> {
  //生成一组测试数据
  static const STATION_NAMES = {
    '齐河县非现场S105北往南向检测点': ['子菜单1', '子菜单2', '子菜单3'],
    '齐河县非现场S105南往北向检测点': ['子菜单1', '子菜单2', '子菜单3'],
    '齐河县非现场华焦路检测点': ['华焦路桩号K15+300米', '华焦路桩号K15+300米', '华焦路桩号K15+300米'],
    '齐河县非现场G309检测点': ['G309桩号K580+600米', 'G309桩号K580+600米'],
    '齐河县非现场G308检测点': [
      'G308桩号K390+550米',
      'G308桩号K390+550米',
      'G308桩号K390+550米',
      'G308桩号K390+550米'
    ],
  };

  ///_buildList
  List<Widget> _buildList() {
    List<Widget> widgets = [];
    STATION_NAMES.keys.forEach((key) {
      widgets.add(_item(key, STATION_NAMES[key]));
    });
    return widgets;
  }

  /// item
  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      children: subCities.map((subCity) => _buildSubCities(subCity)).toList(),
    );
  }

  /// child
  Widget _buildSubCities(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(bottom: 5),
//        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          subCity,
          style: TextStyle(color: Colors.blueGrey, fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设备信息", style: TextStyle(fontSize: 15)),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
    );
  }
}
