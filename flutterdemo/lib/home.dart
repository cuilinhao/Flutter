import 'package:flutter/material.dart';
import 'package:flutterdemo/im.dart';
import 'package:flutterdemo/ums.dart';
import 'package:flutterdemo/share.dart';

class FTHomePage extends StatefulWidget {
  FTHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FTHomePageState createState() => new _FTHomePageState();
}

class _FTHomePageState extends State<FTHomePage> {
  Widget _creatCell(
      String title, String des, String imageName, Function method) {
    return new GestureDetector(
      onTap: method,
      child: new Container(
        // color: Colors.accents,
        padding: const EdgeInsets.fromLTRB(15.0, 22.0, 15.0, 0.0),
        // alignment: AlignmentGeometry,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              imageName,
              height: 28.0,
              width: 28.0,
              fit: BoxFit.cover,
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    title,
                    style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.black87,
                    ),
                  ),
                  new Text(
                    des,
                    style: new TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.pinkAccent,
      ),
      body: new ListView(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          children: <Widget>[
            _creatCell("ShareSDK", "演示ShareSDK在Flutter上的交互", 'assets/share.png',(){
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new FTShareHomePage(title: "ShareSDK Flutter Bridge"),
                // fullscreenDialog: true,
              ));
            }),
            _creatCell("IMSDK", "聊天UI的搭建和IMSDK的交互", 'assets/im.png', (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new FTIMHomePage(),
                // fullscreenDialog: true,
              ));
            }),
            _creatCell("UMSSDK", "普调登录界面", 'assets/ums.png', (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new FTUMSHomePage(),
                // fullscreenDialog: true,
              ));
            }),
            _creatCell("其他", "其他部分功能显示", 'assets/flutter.png', (){
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new FTShareHomePage(),
                // fullscreenDialog: true,
              ));
            }),
          ]),
    );
  }
}
