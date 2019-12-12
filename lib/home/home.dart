import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_truck_app/utils/MyButton.dart';
import 'package:marquee_flutter/marquee_flutter.dart';

/// home page
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

//onTap 对应点击事件，使用GestureDetector 手势检测器 可以给 widget添加点击事件
class HomePageState extends State<HomePage> {
  ///
  void onTab1() {
    print("1..");
  }

  void onTab2() {
    print("2..");
  }

  void onTab3() {
    print("3..");
  }

  void onTab4() {
    print("4..");
  }

  void onTab5() {
    print("5..");
  }

  /// 自定义cell
  Widget cell(final IconData iconData, final String title) {
    return new Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: new Icon(
            iconData,
            size: 30,
            color: Colors.lightGreen,
          )),
          Text(title, style: TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }

  /// 自定义cell
  Widget customerBtn(
      VoidCallback voidCallback, final IconData iconData, final String title) {
    return new MaterialButton(
      onPressed: voidCallback,
//      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: new Icon(
            iconData,
            size: 30,
            color: Colors.lightGreen,
          )),
          Text(title, style: TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }

  ///
  StatefulWidget marqueeWidget() {
    return new MarqueeWidget(
      text: "我的跑马灯。。。。。。 我是跑马灯。。。。",
      textStyle: new TextStyle(fontSize: 16.0),
      scrollAxis: Axis.horizontal,
    );
  }

  ///menu
  Widget gridViewMenu() {
    return new Container(
      //padding
      padding: EdgeInsets.all(20),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行2个
          mainAxisSpacing: 10.0, //主轴方向间距
          crossAxisSpacing: 10.0, //水平方向间距
          childAspectRatio: 1.5, //纵轴缩放比例
        ),
        children: <Widget>[
//          marqueeWidget(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab1,
              title: Text("车辆实时数据",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.directions_bus,
                size: 30,
                color: Colors.blue,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab2,
              title: Text("车辆查询",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.search,
                size: 30,
                color: Colors.lightGreen,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab3,
              title: Text("报表统计",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.multiline_chart,
                size: 30,
                color: Colors.amberAccent,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab4,
              title: Text("站点信息",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.ev_station,
                size: 30,
                color: Colors.orange,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab5,
              title: Text("more",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.more_horiz,
                size: 30,
                color: Colors.lightBlue,
              )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("首页", style: TextStyle(fontSize: 15)),
        ),
        body: gridViewMenu());

//    marqueeWidget(),
    // gridViewMenu(),
  }
}
