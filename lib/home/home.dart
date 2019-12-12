import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          childAspectRatio: 1.0, //纵轴缩放比例
        ),
        children: <Widget>[
          marqueeWidget(),
          SizedBox(height: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: new GestureDetector(
              onTap: onTab1,
              child: cell(Icons.directions_bus, "车辆实时数据"),
            ),
          ),

          ///
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: new GestureDetector(
              onTap: onTab2,
              child: cell(Icons.search, "车辆查询"),
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: new GestureDetector(
              onTap: onTab3,
              child: cell(Icons.multiline_chart, "报表统计"),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: new GestureDetector(
              onTap: onTab4,
              child: cell(Icons.ev_station, "站点信息"),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: new GestureDetector(
              onTap: onTab5,
              child: cell(Icons.more_horiz, "more"),
            ),
          ),

         // marqueeWidget(),
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
        //body: marqueeWidget(),
//      body: gridViewMenu(),
        body: Center(child: gridViewMenu())
//            marqueeWidget(
        );
  }
}
