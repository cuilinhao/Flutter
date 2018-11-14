import 'package:flutter/material.dart';

class FTUmsRecommendedPage extends StatefulWidget {
  // FTRecommendedPage({Key key, this.title}) : super(key: key);
  // final title;

  @override
  _FTUmsRecommendedPageState createState() => new _FTUmsRecommendedPageState();
}

class _FTUmsRecommendedPageState extends State<FTUmsRecommendedPage> {
  Widget _creatCell(String imagePath, String nickName, int sex,
      String introduce, String date) {
    return new Column(children: <Widget>[
      new Container(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: new Row(
          children: <Widget>[
            new Container(
                // child: new Image.network(
                //                       "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538222920307&di=0db41b1e054c6cfa1d34297501576019&imgtype=0&src=http%3A%2F%2Fimg1.touxiang.cn%2Fuploads%2F20130906%2F06-082216_394.jpg",
                //           height: 100.0,
                //           width: 100.0,
                //         ),

                // decoration: BoxDecoration(
                //     border: Border.all(),
                //     borderRadius: BorderRadius.circular(50.0)
                //     )

                // child: new Material(
                //     borderRadius: BorderRadius.circular(50.0),
                //     clipBehavior: Clip.hardEdge,
                //     shadowColor: Colors.blue.shade200,
                //     elevation: 5.0,
                //     child: new Image.network(
                //       "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538222920307&di=0db41b1e054c6cfa1d34297501576019&imgtype=0&src=http%3A%2F%2Fimg1.touxiang.cn%2Fuploads%2F20130906%2F06-082216_394.jpg",
                //       height: 100.0,
                //       width: 100.0,
                //       )
                // ),
                padding: EdgeInsets.only(right:10.0),
                child: new ClipRRect(
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(5.0)
                  ),
                  child: new FadeInImage.assetNetwork(
                    placeholder: "assets/flutter.png",
                    fit: BoxFit.fill,
                    image:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538222920307&di=0db41b1e054c6cfa1d34297501576019&imgtype=0&src=http%3A%2F%2Fimg1.touxiang.cn%2Fuploads%2F20130906%2F06-082216_394.jpg",
                    height: 60.0,
                    width: 60.0,
                  ),
                )
            //     height: 44.0,
            //     width: 44.0,
            //     child: new CircleAvatar(
            //         backgroundImage: new NetworkImage(
            //   "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538222920307&di=0db41b1e054c6cfa1d34297501576019&imgtype=0&src=http%3A%2F%2Fimg1.touxiang.cn%2Fuploads%2F20130906%2F06-082216_394.jpg"
            // )
            // )

                
            ),

            new Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

              // new Container(
              //   // width: 300.0,
              //   // constraints: new BoxConstraints(maxWidth:double.infinity),
              //     child:new Row(
              //   // crossAxisAlignment: CrossAxisAlignment.end,
              //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:<Widget>[
              //     new Text("nickname"),
              //     // new Container(width:50.0, height: 10.0 ,color: Colors.red),
              //     new Text("2010/01/01")
              //   ]
              // ),
              // ),

              new Text("nickname"),
              new Container(height:5.0),
              new Text("sex"),
              new Container(height:5.0),
              new Text("-"),
            ]),

              new Expanded(
                child: new Container(
                  // color: Colors.red,
                  height: 60.0,
                  alignment: Alignment.topRight,
                  child: new Text("2018/01/01")
                  )
              )
          ],
        ),
      ),

      new Container(color: Colors.grey.withAlpha(50), height: 0.5)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        // color:Colors.purple,
        child: new ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
        _creatCell(null, null, null, null, null),
      ],
    ));
  }
}
