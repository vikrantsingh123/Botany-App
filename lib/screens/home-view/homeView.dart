import 'package:flutter/material.dart';
import '../../assets/colors.dart';
import 'dart:convert';

import '../../widgets/horizontalList.dart';
import '../../widgets/buildPopularListMain.dart';
import '../../widgets/myBottomNavigationBar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  List<dynamic> items;

  getJsonData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/botany.json');

    items = json.decode(data);
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  MediaQueryData queryData;
  double width, height, width1, height1;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width / 1000;
    height = MediaQuery.of(context).size.height / 1000;
    // width = width1 / 1000;
    // height = height1 / 1000;
    return Scaffold(
      body: Container(
          color: MyColors.appBackGroundColor,
          width: double.infinity,
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Botany',
                    style: TextStyle(
                        color: Color(0xff0e0d41),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                        decoration: InputDecoration(
                      hintText: "Search for plant names",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    )),
                  )),
                  Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: EdgeInsets.all(15), child: Icon(Icons.mic)),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My query',
                    style: TextStyle(
                        color: Color(0xff0e0d41),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: height * 280,
                  child: HorizontalList(height, width)),
              Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Popular',
                        style: TextStyle(
                            color: MyColors.mainTitleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )),
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return BuildPopularListMain(
                      items[index]['name'], items[index]['link'], height);
                },
              )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  color: Colors.white,
                  height: height * 80,
                  child: MyBottomNavigationBar())
            ],

            //   ),
          )),
    );
  }
}
