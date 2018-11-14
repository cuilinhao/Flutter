import 'package:flutter/material.dart';
import './ums_recommended.dart';
import './ums_user.dart';

class FTUMSHomePage extends StatefulWidget {
  FTUMSHomePage({Key key, this.title}) : super(key: key);
  final title;

  @override
  _FTUMSHomePageState createState() => new _FTUMSHomePageState();
}

class _FTUMSHomePageState extends State<FTUMSHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  final titles = ["推荐","我的"];
  final images = ["assets/zx@3x.png","assets/wd@3x.png"];
  final selectedImages = ["assets/zx_02@3x.png","assets/wd_02@3x.png"];

  final pages = [
    new FTUmsRecommendedPage(),
    new FTUmsUserPage()
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem _creatTapItem(int index) {
      return new BottomNavigationBarItem(
        title: new Text(
          titles[index],
          style: new TextStyle(
            color: (index == _selectedIndex ? Colors.red : Colors.grey),
            fontSize: 14.0
           ),
          
        ),
        icon: new Container(
            // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: new Image.asset(images[index], height: 22.0, width: 22.0)),
        activeIcon: new Container(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            child: new Image.asset(selectedImages[index], height: 22.0, width: 22.0)),
      );
    }

    AppBar _createAppBar(){
      if (_selectedIndex == 0)
      {
        // print("-----------------------> appBar");
        return new AppBar(
          title: new Text("UMSSDK"),
          backgroundColor: Colors.pink,
        );
      }
      else
      {
        // print("-----------------------> null");
        return null;
      }
    }

    return new Scaffold(
      appBar: _createAppBar(),
      resizeToAvoidBottomPadding:false,
      body: pages[_selectedIndex],
      bottomNavigationBar: new Material(
        color: Colors.white24,
        child: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
              _creatTapItem(0),
              _creatTapItem(1),
          ],
          // type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
                          _selectedIndex = index;
                        });
          },
        ),
      ),
    );
  }
}
