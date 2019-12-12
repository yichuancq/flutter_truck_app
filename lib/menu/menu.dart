import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_truck_app/data/datalist.dart';
import 'package:flutter_truck_app/home/home.dart';
import 'package:flutter_truck_app/me/me.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuPageState();
  }
}

class MenuPageState extends State<MenuPage> {
  int index = 0;

  buildBodyPage() {
    if (index == 0) {
      return HomePage();
    }
    if (index == 1) {
      return DataListPage();
    }
    if (index == 2) {
      return MePage();
    }
  }

  // style: Theme.of(context).textTheme.display1,
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: buildBodyPage(),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("首页", style: TextStyle(color: Colors.grey)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.view_list),
            title: new Text("数据", style: TextStyle(color: Colors.grey)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text("我", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}