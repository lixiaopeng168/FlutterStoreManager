
import 'package:flutter/widgets.dart';

class MainAddressWidget extends StatefulWidget {

   int lineColor = 0xff87CEFA;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainAddressState();
  }
}

class _MainAddressState extends State<MainAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      //头部引导
      children: <Widget>[
        _topGuide(),
          _topLine(),
        _searchContent(),
      ],
    );
  }

  Widget _topGuide() {
    return new Container(
        width: 200,
        height: 30,
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
            top: const BorderSide(width: 1.0,color: const Color(0xff87CEFA)),
            left: const BorderSide(width: 1.0,color: const Color(0xff87CEFA)),
            right: const BorderSide(width: 1.0,color:const Color(0xff87CEFA)),
          )
        ));
  }

  /**
   * const Border(
      left: const BorderSide(color: Color(0xff87CEFA),width: 1.0),
      right:const BorderSide(color: Color(0xff87CEFA),width: 2.0),
      top:const BorderSide(color: Color(0xff87CEFA),width: 2.0)
      )

      Border.all(
      color: Color(0xff87CEFA),
      width: 1.0
      )
   */
  //线
  Widget _topLine() {
    return new Container(
      height: 1.0,
      color: const Color(0xff87CEFA),
    );
  }
  //搜索内容
 Widget _searchContent(){
    return new Row(
      children: <Widget>[

      ],
    );
 }

 //搜索id
Widget _searchContentId(){
    return new Text("99");
}

}

