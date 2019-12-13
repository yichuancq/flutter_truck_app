import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_truck_app/utils/mybutton.dart';

/// 报表统计
class ReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReportPageState();
  }
}

//轴型统计，车牌统计，次数统计，流量统计，速度统计
class ReportPageState extends State<ReportPage> {
  void onTab() {
    // infoDialog();
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
              onPress: onTab,
              title: Text("轴型统计",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.graphic_eq,
                size: 30,
                color: Colors.blue,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab,
              title: Text("车牌统计",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.confirmation_number,
                size: 30,
                color: Colors.lightGreen,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab,
              title: Text("次数统计",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.timer,
                size: 30,
                color: Colors.amberAccent,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab,
              title: Text("流量统计",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.multiline_chart,
                size: 30,
                color: Colors.orange,
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: MyButton(
              onPress: onTab,
              title: Text("速度统计",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              iconButton: new IconButton(
                  icon: new Icon(
                Icons.play_arrow,
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
          title: Text("报表统计", style: TextStyle(fontSize: 15)),
        ),
        body: gridViewMenu());
  }
}
