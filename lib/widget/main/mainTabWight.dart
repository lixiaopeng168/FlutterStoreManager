import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storyManager/model/mainTabListModel.dart';


/**
 * 左侧tab
 */

//第一种自定义回调方法
typedef onItemClick = Future Function(int index);

class MainTabWight extends StatefulWidget {
  MainTabWight({Key key,
    this.datas,
    this.lineColor = Colors.white70,
    this.lineHeight = 1.0,
    this.normalColor = Colors.white,
    this.selectColor = Colors.white70,
    this.normalTextColor = Colors.black,
    this.selectTextColor = Colors.blue,
    this.fontSize = 16,
    this.paddingBottom = 20,
    this.paddingTop = 20,
    this.selectIndex = 0,
    this.onClick
  })
      : super(key: key);

  //数据
  final List<MainTabListModel> datas;

  //线条颜色
  final Color lineColor;

  //线条高度
  final double lineHeight;

  //默认颜色
  final Color normalColor;

  //选中颜色
  final Color selectColor;

  //默认字体颜色
  final Color normalTextColor;

  //选中字体颜色
  final Color selectTextColor;

  //字体大小
  final double fontSize;

  //设置内边距
  final double paddingTop;
  final double paddingBottom;

  //回调
  final onItemClick onClick;

  //设置默认选中值
   int selectIndex;
  _MyTabWightState _mainState;
  /**
   * 左侧 tab 是由list  点击的时候 让item变色
   */
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("初始化Lefttab");
    return _mainState = new _MyTabWightState();
  }

  void updateItem(int index){
    _mainState._updateItem(index);
  }
}

class _MyTabWightState extends State<MainTabWight> {
  @override
  void initState() {
    super.initState();
    widget.datas.elementAt(widget.selectIndex).isSelect = true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createListView();
  }

  /**
   * 创建listView
   */
  Widget _createListView() {
    return new ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _createText(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return _createLine(index);
      },
      itemCount: widget.datas.length,
    );
  }

  /**
   *  list  item 样式
   */
  Widget _createText(int index) {
    MainTabListModel item = widget.datas.elementAt(index);
    return new MaterialButton(
      child: _itemText(item),
      color: item.isSelect ? widget.selectColor : widget.normalColor,
//      alignment: Alignment.center,
      padding: new EdgeInsets.only(
          left: 0.0,
          top: widget.paddingTop,
          right: 0.0,
          bottom: widget.paddingBottom),
          onPressed: () => {
            _updateItem(index),
//            widget.onClick(index)
          },
    );
  }



  /**
   * list item text 样式
   */
  Widget _itemText(MainTabListModel item) {
    return new Text(
          item.text,
          style: new TextStyle(
              color:
              item.isSelect ? widget.selectTextColor : widget.normalTextColor,
              fontSize: widget.fontSize
          ),
    );
  }

  /**
   * list item 线条
   */
  Widget _createLine(int index) {
//  MainTabListModel item =   widget.datas.elementAt(index);
    return new Container(height: widget.lineHeight, color: widget.lineColor);
  }


  /**
   * 更新item
   */
  void _updateItem(int index){
    print("tabItem :-> ${widget.selectIndex}\tindex:$index");
    setState(() {
      widget.datas.elementAt(widget.selectIndex).isSelect = false;
      widget.datas.elementAt(index).isSelect = true;
      widget.selectIndex = index;
      widget.onClick(index);
    });
  }

}


//定义一个抽象类
abstract class OnStatusChangeListener{
  void onItemClick(int index);
}