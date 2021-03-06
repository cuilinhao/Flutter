import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './im_chat.dart';

class FTIMHomePage extends StatefulWidget {
  FTIMHomePage({Key key, this.title}) : super(key: key);
  final title;

  @override
  State<StatefulWidget> createState() => new _FTIMHomePageState();
}

class _FTIMHomePageState extends State<FTIMHomePage> {
  final List _conversations = ["1", "2"];

  Container _configCell() {
    return new Container(
      height: 68.0,
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: new ClipOval(
                child: new Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539578399109&di=7086db6880bf996b1289f428bd4e0e5a&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201509%2F19%2F20150919141025_AxJHc.jpeg",
              height: 55.0,
              width: 55.0,
            )),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                    child: new Padding(
                        padding: EdgeInsets.only(top: 10.0, right: 15.0),
                        child: new Row(children: <Widget>[
                          new Expanded(
                              child: new Text(
                            "Anyko",
                            style: new TextStyle(
                                color: Colors.black87, fontSize: 17.0),
                          )),
                          new Text(
                            "20:23",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ]))),
                new Expanded(
                  child: new Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: new Text(
                        "Hello, Hello, 这首Enemy挺好听的",
                        textAlign: TextAlign.left,
                        style:
                            new TextStyle(color: Colors.grey, fontSize: 14.0),
                      )),
                ),
                new Container(height: 0.25, color: Colors.grey[500])
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _creatConversations(int index) {
    return new GestureDetector(
      onTap: () {
        final userid = _conversations[index];

        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new FTIMChat(uid: userid),
              // fullscreenDialog: true,
            ));
      },
      child: _configCell(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          middle: new Text("消息",
              style: new TextStyle(
                  fontSize: 17.0, color: Color.fromARGB(255, 73, 73, 83))),
          leading: new GestureDetector(
            child:
                new Image.asset("assets/back.png", height: 30.0, width: 30.0),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          trailing: new GestureDetector(
            child: new Image.asset(
              "assets/service.png",
              height: 27.0, width: 27.0
            ),
            onTap: () {
              print("------------> pressed");
            },
          ),
        ),
        // backgroundColor: Colors.green,
        child: new Material(
          child: new Container(
              child: new ListView.builder(
            itemCount: _conversations.length,
            itemBuilder: (BuildContext context, int position) {
              return _creatConversations(position);
            },
          )),
        ));
  }
}
