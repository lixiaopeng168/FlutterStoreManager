
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/IColor.dart';
import 'model/mainTabListModel.dart';
import 'widget/main/mainAddressWight.dart';
import 'widget/main/mainTabWight.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(

      home: new _MyHomeWidget(),
    );

  }
}

class _MyHomeWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyAppState();
  }

}


class _MyAppState extends State<_MyHomeWidget> {
  //用户
  static const int indexUser = 0;

  //地址
  static const int indexAddress = 1;

  //订单
  static const int indexOrder = 2;

  //商品
  static const int indexStore = 3;

  //栏目管理
  static const int indexColumn = 4;

  //系统设置
  static const int indexSet = 5;
  //appbar
  AppBar _appBar;
  //左侧数据
  List<MainTabListModel> _tabList;
  //左侧栏目
  MainTabWight _mainTabWight;
  //展示的下标，默认展示0
  int _selectIndex = 1;

  //距离底部距离
  double _marginBottom = 30;
  //地址管理page
   MainAddressWidget _mainAddressWidget;

   //总高度
  double _rightHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initAppbar();
    //初始化leftTab
    _initMainTabWight();
    //初始化list
    _initListView();
    //地址管理
    _mainAddressWidget = new MainAddressWidget();
//    final size =MediaQuery.of(context).size;
  }
  void _initAppbar() {
    _appBar = new AppBar(
      title: new Text("xxx管理系统"),

    );
  }
  void _initMainTabWight(){
    _tabList = new List();
    _tabList.add(MainTabListModel(isSelect: false, text: "用户管理"));
    _tabList.add(MainTabListModel(isSelect: false, text: "地址管理"));
    _tabList.add(MainTabListModel(isSelect: false, text: "订单管理"));
    _tabList.add(MainTabListModel(isSelect: false, text: "商品管理"));
    _tabList.add(MainTabListModel(isSelect: false, text: "栏目管理"));
    _tabList.add(MainTabListModel(isSelect: false, text: "系统设置"));
    for(int i=0;i < _tabList.length;i++){
      _tabList[i].isSelect = false;
      if(_selectIndex == i) {
        _tabList[_selectIndex].isSelect = true;
        break;
      }
    }

    _mainTabWight = new MainTabWight(
      datas: _tabList,
      selectIndex: _selectIndex,
//      normalColor: Color(0xffefefef),
      // ignore: missing_return
      onClick: (index) {
        _onColumnItemClick(index);
      },);
  }
  void _initListView(){

  }

  @override
  Widget build(BuildContext context) {
    _rightHeight = MediaQuery.of(context).size.height;
    _mainAddressWidget.marginHeight = _appBar.preferredSize.height*2  + _marginBottom + 20;
//    print('build Height: $_rightHeight    ${_appBar.preferredSize.height}  ${_mainAddressWidget.marginHeight}');
//    ScreenUtil.init(context);
//    var size = MediaQuery.of(context).size;
    return new MaterialApp(
//        routes: <String, WidgetBuilder> {
//          '/main': (BuildContext context) => new MyApp(),
////        '/screen2' : (BuildContext context) => new Screen2(),
////        '/screen3' : (BuildContext context) => new Screen3(),
//        },

        title: 'xxx管理系统',
        debugShowCheckedModeBanner: true,
        home: new Scaffold(
          appBar:  _appBar,
          body: new Row(
//          verticalDirection: ,
//            verticalDirection: ,
            children: <Widget>[
              //TODO 左侧列表
              new Expanded(
                child: _leftTab(),
                flex: 1,
              ),
              // TODO   右侧内容区域
              new Expanded(
                child: new Container(
//                  height: size.height - _appBar.preferredSize.height,
                  height: _rightHeight - _appBar.preferredSize.height*2 ,
                  alignment: Alignment.topLeft,
                  /// TODO 列表绘制
                  child: _rightListView(_selectIndex), //EE6A50
                  margin: new EdgeInsets.only(left: 30,top: 20,right: 30,bottom: _marginBottom),
                  padding: new EdgeInsets.all(10),
//                  color: new Color(0xffEE6A50),
                  decoration: new BoxDecoration(
                      color: IColor.white,
                      border: Border.all(
                          color:  IColor.line,
                          width: 2
                      )
                  ),
                ),
                flex: 3,
              )
              // new MyTabs()
            ],
          ),
        ));
  }

//-----------------  左侧选择 start-------------------------------
  //左侧 姓名 和 栏目选中
  Widget _leftTab() {
    return new Column(
//      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        _leftHead(),
        new Expanded(
          child: _leftColumn(),
          flex: 1,
        )
      ],
    );
  }

//左侧头部
  Widget _leftHead() {
    return new Container(
      height: 200,
//        width: ,
      alignment: Alignment.center,
      color: IColor.white,
      child: new Text(
        "lxp",
        style: new TextStyle(color: Colors.lightBlue, fontSize: 15),
      ),
    );
  }

//左侧 栏目
  Widget _leftColumn() {
    return new Container(
        child: _mainTabWight,
        color: IColor.white,
        margin: new EdgeInsets.only(bottom: _marginBottom),
    );
  }

// 左侧 栏目 item点击回调
  void _onColumnItemClick(int index) {
    _selectIndex = index;
//    _mainTabWight.updateItem(index);
    setState(() {
    });
  }

  //-----------------  左侧选择 end-------------------------------
//-----------------  右侧 start-------------------------------
  ListView _listView;
  // 右侧listview页面管理
  Widget _rightListView(int index) {
//    print("_rightListView execute :${ScreenUtil.screenWidth} \t ${ScreenUtil.screenHeight}  \t ${_appBar.preferredSize.height}");
    return    new ListView(
      shrinkWrap: true,
      children: <Widget>[
        new Offstage(
          child: _rightManagerUser(),
          offstage: index == indexUser ? false : true,
        ),
        new Offstage(
          child:_rightManagerAddress() ,
          offstage: index == indexAddress ? false : true,
        ),
        new Offstage(
          child:  _rightManagerOrder(),
          offstage: index == indexOrder ? false : true,
        ),
        new Offstage(
          child:_rightManagerStore() ,
          offstage: index == indexStore ? false : true,
        ),
        new Offstage(
          child: _rightManagerColumn(),
          offstage: index == indexColumn ? false : true,
        ),
        new Offstage(
          child: _rightManagerSet(),
          offstage: index == indexSet ? false : true,
        ),

        //地址管理
      ],
    );
  }

//用户
  Widget _rightManagerUser(){
    return new Text("用户管理");
  }
//地址
  Widget _rightManagerAddress(){
    return _mainAddressWidget;
  }
//订单
  Widget _rightManagerOrder(){
    return new Text("订单管理");
  }
  //商品
  Widget _rightManagerStore(){
    return new Text("商品管理");
  }
  //商品
  Widget _rightManagerColumn(){
    return new Text("栏目设置");
  }
  //商品
  Widget _rightManagerSet(){
    return new Text("系统设置");
  }


//-----------------  右侧 end-------------------------------
}