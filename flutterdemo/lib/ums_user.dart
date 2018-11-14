import 'package:flutter/material.dart';
// import 'package:';

class FTUmsUserPage extends StatefulWidget {
  // FTRecommendedPage({Key key, this.title}) : super(key: key);
  // final title;

  @override
  _FTUmsUserPageState createState() => new _FTUmsUserPageState();
}

class _FTUmsUserPageState extends State<FTUmsUserPage> {

  var _controller = new ScrollController();
  double _offset = 0.0;

  Widget _createNumbers(String title, int num) {
    return new Expanded(
        child: new Column(
      children: <Widget>[
        new Text("0",
            style: new TextStyle(color: Colors.white, fontSize: 15.0)),
        new Text(
          "关注",
          style: new TextStyle(color: Colors.white, fontSize: 15.0),
        )
      ],
    ));
  }

  Widget _createUserDetailWidget() {
    return new Container(
      // height:200.0,
      color: Colors.red[300],
      alignment: Alignment.topCenter,
      // padding: EdgeInsets.only(top:10.0),
      child: new Column(children: <Widget>[
        new Container(
            padding: EdgeInsets.only(
                right: 24.0, top: 15.0 + MediaQuery.of(context).padding.top),
            alignment: Alignment.centerRight,
            child: new Image.asset("assets/flutter.png",
                height: 20.0, width: 20.0)),
        new ClipOval(
          child: new Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538222920307&di=0db41b1e054c6cfa1d34297501576019&imgtype=0&src=http%3A%2F%2Fimg1.touxiang.cn%2Fuploads%2F20130906%2F06-082216_394.jpg",
            height: 66.0,
            width: 66.0,
          ),
        ),
        new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: new Text(
              "漂亮的小姐姐一枚",
              style: new TextStyle(color: Colors.white, fontSize: 15.0),
            )),
        new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: new Text(
              "Female Chinese Hong Kong",
              style: new TextStyle(color: Colors.white, fontSize: 13.0),
            )),
        new Container(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: new Row(
              children: <Widget>[
                _createNumbers("关注", 0),
                new Container(width: 1.0, height: 27.0, color: Colors.white),
                _createNumbers("粉色", 0),
                new Container(width: 1.0, height: 27.0, color: Colors.white),
                _createNumbers("相互关注", 0),
              ],
            )),
      ]),
    );
  }

  Widget _createCell(String title, String des) {
    return new Container(
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Container(
              padding: EdgeInsets.only(left: 24.0),
              alignment: Alignment.center,
              height: 44.0,
              child: new Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              )),
          new Expanded(
              child: new Container(
            padding: EdgeInsets.only(right: 24.0),
            child: new Text(des, textAlign: TextAlign.right),
          ))
        ],
      ),
    );
  }

  @override
    void initState() {
      // TODO: implement initState
      _controller.addListener(
        (){
          setState((){
            // _offset = -_controller.offset + MediaQuery.of(context).padding.top + 5.0;
            _offset = _controller.offset;
          });
        }
      );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return new Stack(
    //   children: <Widget>[
    //     new Container(
    //       color:Colors.grey[100]
    //     ),

    //     new Container(
    //       color: Colors.red[300],
    //       // color: Colors.green,
    //       height: _offset<=0.0?0.0:_offset,
    //     ),

    //     new ListView(
    //       controller: _controller,
    //       physics: AlwaysScrollableScrollPhysics(),
    //         children: <Widget>[
    //             _createUserDetailWidget(),
    //             new Container(height: 15.0),
    //             _createCell("我的会员", "未购买"),
    //             new Container(height: 15.0),
    //             _createCell("我的好友", ""),
    //             new Container(height: 0.5),
    //             _createCell("个人资料", "13"),
    //       ]),
    //   ],
    // );

    return new SingleChildScrollView(
      controller: _controller,
      physics: AlwaysScrollableScrollPhysics(),
      child:new Container(
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom - kBottomNavigationBarHeight,
        child: new Column(
          children:<Widget>[
                _createUserDetailWidget(),
                new Container(height: 15.0),
                _createCell("我的会员", "未购买"),
                new Container(height: 15.0),
                _createCell("我的好友", ""),
                new Container(height: 0.5),
                _createCell("个人资料", "13"),
          ]
        ),
      ),
    );
  }
}
