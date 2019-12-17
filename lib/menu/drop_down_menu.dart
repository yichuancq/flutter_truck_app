import 'package:dropdown_menu/dropdown_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_truck_app/truck/truckInfoList2.dart';
import 'menu_data.dart';

///下拉筛选
///
dynamic subData;
var degreeType = 0;

class DropDownMenu extends StatefulWidget {
  ///下拉筛选
  @override
  State<StatefulWidget> createState() {
    return new DropDownMenuState();
  }
}

///下拉筛选
class DropDownMenuState extends State<DropDownMenu>
    with AutomaticKeepAliveClientMixin {
  GlobalKey globalKey;
  var listView = new TruckInfoListPage(data:subData);

  ///
  @override
  bool get wantKeepAlive => true;

  //header
  DropdownHeader buildDropdownHeader({DropdownMenuHeadTapCallback onTap}) {
    return new DropdownHeader(
      onTap: onTap,
      titles: [
        TYPES[TYPE_INDEX],
        //ORDERS[ORDER_INDEX],
        DEGREETYPES[DGTYPE_INDEX]
      ],
    );
  }

  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(
        maxMenuHeight: kDropdownMenuItemHeight * 10,
        menus: [
          //menu1
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPES.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: DGTYPE_INDEX,
                  data: DEGREETYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * DEGREETYPES.length),
        ]);
  }

  Widget myController() {
    listView.createState();
    //
    return new Column(
      children: <Widget>[
        buildDropdownHeader(),
        new Expanded(
            child: new Stack(
          children: <Widget>[
            listView,
            buildDropdownMenu(),
          ],
        )),
      ],
    );
  }

  ///构建菜单
  Widget buildFixHeaderDropdownMenu() {
    return new DefaultDropdownMenuController(
      //选择事件
      onSelected: ({int menuIndex, int index, int subIndex, dynamic data}) {
        setState(() {
          degreeType = menuIndex;
          subData = data;
          print("menu id->${menuIndex}");
          print("index ->${index}");
          print("subIndex ->${subIndex}");
          print("data ->${data.toString()}");
          //
          listView.createState(data: subData);
          // TODO refresh
          //{title: S105NB, id: 4}
        });
      },
      child: myController(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    listView = null;
  }

  ///
  @override
  Widget build(BuildContext context) {
    String title = "车辆查询";
    //更新列表
    setState(() {
//     print("_parentMenuId1=$parentMenuId");
      print("_subData1=$subData");
    });
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title, style: TextStyle(fontSize: 15)),
      ),
      body: buildFixHeaderDropdownMenu(),
    );
  }
}
