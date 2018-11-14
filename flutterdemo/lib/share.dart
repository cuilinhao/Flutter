import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class ShareSDKUtil<PlatformChannel> {
  static const channel = const MethodChannel('com.mob.flutter/sharesdk');

  static Future<Map> share(int platform, Map params) async {
    return await channel.invokeMethod("share", [platform, params]);
  }

  static Future<Map> auth(int platform, Map params) async {
    return await channel.invokeMethod("auth", [platform, params]);
  }

  static Future<Map> showMenu(List platforms, Map params) async {
    return await channel.invokeMethod("showMenu", [platforms, params]);
  }

  static Future<Map> showEditor(int platform, Map params) async {
    return await channel.invokeMethod("showEditor", [platform, params]);
  }
}

class FTShareHomePage extends StatelessWidget {

  FTShareHomePage({Key key,this.title}) : super(key: key);
  final title;

   Map getShareParams() {
    List images = [
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537337235805&di=9c6628d3612011154b41d614999c7c5c&imgtype=jpg&src=http%3A%2F%2Fimg1.imgtn.bdimg.com%2Fit%2Fu%3D2221197416%2C360927839%26fm%3D214%26gp%3D0.jpg"
    ];
    return {"text": "text", "images": images, "url": "http://www.mob.com/"};
  }

  void shareToWechat(BuildContext context) {
    Map result;

    void showLog() async {
      result = await ShareSDKUtil.share(22, getShareParams());
      showAlert(result, context);
    }

    showLog();
  }

  void authToWechat(BuildContext context) {
    
    Map result;
    void showLog() async {
      result = await ShareSDKUtil.auth(22, null);
      showAlert(result, context);
    }

    showLog();
  }

  void shareToSina(BuildContext context) {
    Map result;
    void showLog() async {
      result = await ShareSDKUtil.share(1, getShareParams());
      showAlert(result, context);
    }

    showLog();
  }

  void authToSina(BuildContext context) {
    Map result;
    void showLog() async {
      result = await ShareSDKUtil.auth(1, null);
      showAlert(result, context);
    }

    showLog();
  }

  void showShareMenu(BuildContext context) {
    Map result;
    void showLog() async {
      result = await ShareSDKUtil.showMenu(null, getShareParams());
      showAlert(result, context);
    }

    showLog();
  }

  void showEditor(BuildContext context) {
    Map result;
    void showLog() async {
      result = await ShareSDKUtil.showEditor(1, getShareParams());
      showAlert(result, context);
    }

    showLog();
  }

  void showAlert(Map content, BuildContext context) {
    String title = "失败";
    int state = content["state"];
    switch (state) {
      case 1:
        title = "成功";
      break;
      case 2:
       title = "失败";
      break;
      case 3:
        title = "取消";
      break;
      default:
        title = state.toString();
      break;
    }

    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
                title: new Text(title),
                content: new Text(content.toString()),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]));
  }

  Widget _creatRow(String methodName, String methodDes, Function method, BuildContext context) {
    return new GestureDetector(
      onTap: (){
        method(context);
      },
      child: new Container(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // padding: const EdgeInsets.only(bottom: 2.0),
          children: [
            new Container(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: new Text(
                methodName,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Text(
              methodDes,
              style: new TextStyle(
                color: Colors.grey[500],
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Container(
                padding: const EdgeInsets.only(top: 0.33),
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView(
        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        children: <Widget>[
          _creatRow("分享到微信", "分享图片到微信", shareToWechat,context),
          _creatRow("微信授权", "微信授权", authToWechat,context),
          _creatRow("新浪分享", "分享多图到新浪微博", shareToSina,context),
          _creatRow("新浪授权", "新浪授权", authToSina,context),
          _creatRow("弹出分享菜单", "弹出分享菜单", showShareMenu,context),
          _creatRow("弹出编辑界面", "分享直接进行内容编辑", showEditor,context),
        ],
      ),
    );
  }
}