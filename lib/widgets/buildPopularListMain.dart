import 'package:flutter/material.dart';
import './buildPopularList.dart';

class BuildPopularListMain extends StatelessWidget {
  final name, imageLink, height;

  BuildPopularListMain(this.name, this.imageLink, this.height);

  @override
  Widget build(BuildContext context) {
    // _buildPopularListMain(name, imageLink) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        height: height * 100,
        child: Card(
            // semanticContainer: true,
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            margin: EdgeInsets.only(left: 20, right: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: BuildPopularList(name, imageLink, height)));
  }
}
