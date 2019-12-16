import 'package:flutter/material.dart';

///地图页面
class RefreshPage extends StatefulWidget {
  RefreshPage({Key key}) : super(key: key);

  @override
  RefreshListViewPage createState() {
    return new RefreshListViewPage();
  }
}

class RefreshListViewPage extends State {
  //上拉加载 step 1
  ScrollController _scrollController = ScrollController();
  List<String> list = new List();

  RefreshListViewPage() : super() {
    for (var i = 0; i < 30; i++) {
      list.add("ListItem = $i");
      print("$i");
    }
  }

  //上拉加载 step 2
  ///状态被初始化完成
  @override
  void initState() {
    super.initState();
    // 上拉加载  step 3
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("列表到底啦");
        // 上拉加载  step 5
        _onLoadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget headView() {
    return new Card(
      color: Colors.blueGrey,
      child: new Container(
        //padding: const EdgeInsets.only(left:0,bottom: 10),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: new IconButton(icon: new Icon(Icons.person)),
          ),
          title: new Text("用户名称",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          //自定义样式
          subtitle: Text(
            "站点检测站点1，登录时间:" + "2019-07-19 18:22:09",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _listViewRefreshIndicator() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        //上拉加载 step 4
        itemCount: list.length + 1,
        itemBuilder: _loadWidget,
        // 上拉加载 step 1
        controller: _scrollController,
      ),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        List<String> refreshList = new List();
        for (var i = 0; i < 4; i++) {
          refreshList.add("下拉刷新 = $i");
        }
        refreshList.addAll(list);
        list.clear();
        list.addAll(refreshList);
      });
    });
  }

  /**
   *上拉加载
   * */
  Future<Null> _onLoadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        List<String> refreshList = new List();
        for (var i = 0; i < 6; i++) {
          refreshList.add("上拉加载 = $i");
        }
        list.addAll(refreshList);
      });
    });
  }

  /**
   * 区分上拉时返回的Widget
   * */
  Widget _loadWidget(BuildContext ctx, int i) {
    if (i < list.length) {
      // 返回正常Item的Widget
      return ListTile(
        title: Text("${list[i]}"),
        leading: Icon(Icons.home),
        subtitle: Text("副标题 ${list[i]}"),
      );
    } else {
      // 返回上拉加载布局的Widget
      return Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.grey,
          width: double.infinity,
          height: 50,
          child: Text("正在加载..."),
        ),
      );
    }
  }

  ///build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
        child: _listViewRefreshIndicator(),
      ),
    );
  }
}
