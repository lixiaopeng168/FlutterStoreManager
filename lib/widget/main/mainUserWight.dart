import 'package:flutter/material.dart';
import 'package:storyManager/common/IColor.dart';

import 'mainTopGuideWight.dart';

class MainUserWight extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainUserState();
  }
}


class _MainUserState extends State{
  //顶部引导
  double _guideHeight = 30;
  //线
  double _guideLine = 1;
  //添加修改删除的高度
  double _operateHeight = 50;
  //搜索框的高度
  double _searchHeight = 50;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          _topGuide(),
          _topLine(),
//          _tabView(),
      ],
    );
  }


  //引导提示
  /// 顶部引导
  Widget _topGuide() {
    List<String> list = ["首页","用户管理"];
    return new MainTopGuideWight(
//      width:200.0,
      height: _guideHeight,
      list: list,
    );
  }

  ///  tab切换
  Widget _tabView() {
    List<Widget>  listTab = [
      Tab(icon: Icon(Icons.local_florist)),
      Tab(icon: Icon(Icons.change_history)),
      Tab(icon: Icon(Icons.directions_bike)),
    ];
    List<Widget>  listTabView = [
      Tab(icon: Icon(Icons.local_florist,size: 128.0,color: Colors.black,)),
      Tab(icon: Icon(Icons.change_history,size: 128.0,color: Colors.black)),
      Tab(icon: Icon(Icons.directions_bike,size: 128.0,color: Colors.black)),
    ];
    return new DefaultTabController(
       length: 3,
       child: new Scaffold(
         appBar: new AppBar(
           bottom: new TabBar(
               unselectedLabelColor: Colors.red,
               indicatorColor: Colors.blue,
               indicatorSize: TabBarIndicatorSize.label,
               indicatorWeight: 10,
               tabs: listTab
           ),
         ),
         body: new TabBarView(
             children: listTabView
         ),
       ),
    );
  }

  /// line
  Widget _topLine(){
    return new Container(
       color: IColor.line_blue,
       height: _guideLine,
    );
  }


}