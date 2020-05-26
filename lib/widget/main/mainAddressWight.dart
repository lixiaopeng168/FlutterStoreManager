import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storyManager/common/IColor.dart';

class MainAddressWidget extends StatefulWidget {
  int lineColor = 0xff87CEFA;

  //id
  String userId = "";

  //地址id
  String addressId;

  //设置高度
  double marginHeight;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainAddressState();
  }
}

class _MainAddressState extends State<MainAddressWidget> {
  //顶部引导
  double _guideHeight = 30;

  //线
  double _guideLine = 1;

  //搜索区域高度
  double _searchHeight = ScreenUtil().setHeight(90);

  //底部内容区域高度
  double _contentHeight;
  double _contentWidth;

  //右侧外边距
//  double _outRight =

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    var size = MediaQuery.of(context).size;
//    _contentHeight = size.height - _searchHeight - _guideHeight - _guideLine - 70 - 56 - 56;
    _contentHeight = size.height - _searchHeight - _guideHeight - _guideLine - widget.marginHeight;
    _contentWidth = size.width;
//    print("size : ${size.width}  ${size.height}  $_contentHeight");
    return new Column(
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      //头部引导
      children: <Widget>[
        _topGuide(),
        _topLine(),
        _searchContent(),
//        new Text("内容区域:${widget.userId} -- ${widget.addressId}"),
        _contentRect(),
      ],
    );
  }

  /// 顶部引导
  Widget _topGuide() {
    return new Container(
        width: 200,
        height: _guideHeight,
        alignment: Alignment.center,
        child: new Text(
          "地址管理",
          style: new TextStyle(color: Color(0xff444444), fontSize: 13),
        ),
        decoration: new BoxDecoration(
            color: Color(0xffffffff),
//          borderRadius: new BorderRadius.only(
//            topLeft: Radius.circular(1.0),
//            topRight: Radius.circular(1.0)
//          ),
            border: new Border(
              top: const BorderSide(width: 1.0, color: const Color(IColor.i_blue_87)),
              left:
                  const BorderSide(width: 1.0, color: const Color(IColor.i_blue_87)),
              right:
                  const BorderSide(width: 1.0, color: const Color(IColor.i_blue_87)),
            )));
  }

  /// 线
  Widget _topLine() {
    return new Container(
      height: _guideLine,
      color: const Color(IColor.i_blue_87),
    );
  }

  final TextEditingController _controllerId = new TextEditingController();

  /// 搜索内容
  Widget _searchContent() {
    return new Container(
      margin: new EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      height: _searchHeight,
      child: new Row(
        children: <Widget>[
          _searchContentId("用户id:", 0.0),
          _searchContentEdit(0),
          _searchContentId("地址id:", new ScreenUtil().setWidth(20)),
          _searchContentEdit(1),
          _searchButton()
        ],
      ),
    );
  }

  /// 搜索内容
  Widget _searchContentId(String text, double l) {
    return new Container(
      margin: new EdgeInsets.only(left: l),
      child: new Text(
        text,
        style: new TextStyle(
            color: IColor.black_44, fontSize: ScreenUtil().setSp(17)),
      ),
    );
  }

  /// 搜索框
  Widget _searchContentEdit(int flag) {
    return new Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(70),
      alignment: Alignment.center,
      margin: new EdgeInsets.only(left: ScreenUtil().setWidth(5)),
      child: new TextField(
        style: new TextStyle(
            color: IColor.black_44, fontSize: ScreenUtil().setSp(15)),
        decoration: new InputDecoration(
//            contentPadding: const EdgeInsets.all(10),
            contentPadding: EdgeInsets.only(
              top: ScreenUtil().setHeight(19),
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15),
            ),
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)))),
        maxLines: 1,
        cursorColor: IColor.blue_87,

        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,

//        controller: _controllerId,
        //文本对齐方式
        autocorrect: true,
//        //是否自动更正
        autofocus: true,
        //是否自动对焦
//       obscureText: true,//是否是密码
//       inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
//        onChanged: (text) {
//          //内容改变的回调
//          print('change $text');
//        },
        onSubmitted: (text) {
          //内容提交(按回车)的回调
          if (flag == 0) {
            widget.userId = text;
          } else if (flag == 1) {
            widget.addressId = text;
          }
        },
      ),
    );
  }

  /// 搜索按钮
  Widget _searchButton() {
    return new Container(
      margin: new EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      child: new MaterialButton(
          child: new Text(
            "搜索",
            style: new TextStyle(color: Colors.white),
          ),
          color: IColor.blue_19,
          minWidth: ScreenUtil().setWidth(50),
          height: ScreenUtil().setHeight(60),
          onPressed: () => {setState(() {})}),
    );
  }

  /// 中部区域边框
  Widget _contentRect() {
    return new Container(
        height: _contentHeight,
        width: _contentWidth,
        margin: new  EdgeInsets.only(
          top: ScreenUtil().setWidth(10),
          right: ScreenUtil().setWidth(15)
        ),
        decoration: new BoxDecoration(
//      color: IColor.gray,
            border: new Border.all(color: Color(IColor.i_blue_87), width: 1)));
  }
}
