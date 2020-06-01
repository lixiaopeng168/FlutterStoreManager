import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storyManager/common/IColor.dart';

class MainTopGuideWight extends StatelessWidget{

  final double height;
  final double width;

  final List<String> list;

  MainTopGuideWight({Key key,this.width=300,this.height=200,this.list}){}


  @override
  Widget build(BuildContext context) {
    return new Container(
      width: this.width,
      height: this.height,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,i){
          //最后一个不加箭头
          String item =  i == list.length-1 ? "" : "  >  ";
          return new Text(
            "${list.elementAt(i)}$item",
            style: new TextStyle(
                color: Color(0xff999999),
                fontSize: ScreenUtil().setSp(12)
            ),
          );
        },
        itemCount: list.length,
      ),
    ) ;
//    return   new Container(
//        width: width,
//        height: height,
//        alignment: Alignment.center,
//        child: new Text(
//          text,
//          style: new TextStyle(color: Color(0xff444444), fontSize: 13),
//        ),
//        decoration: new BoxDecoration(
//            color: Color(0xffffffff),
////          borderRadius: new BorderRadius.only(
////            topLeft: Radius.circular(1.0),
////            topRight: Radius.circular(1.0)
////          ),
//            border: new Border(
//              top: const BorderSide(
//                  width: 1.0, color: const Color(IColor.i_blue_87)),
//              left: const BorderSide(
//                  width: 1.0, color: const Color(IColor.i_blue_87)),
//              right: const BorderSide(
//                  width: 1.0, color: const Color(IColor.i_blue_87)),
//            )
//        )
//    );
  }


}