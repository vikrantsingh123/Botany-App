import 'package:flutter/material.dart';
import '../screens/camera-screen/cameraScreen.dart';
import '../assets/colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings, color: MyColors.iconThemeColor),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.explore, color: MyColors.iconThemeColor),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CameraScreen()));
          },
          icon: Icon(
            Icons.scanner,
            color: MyColors.iconThemeColor,
            size: 40,
          ),
          padding: EdgeInsets.only(bottom: 20),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.message, color: MyColors.iconThemeColor),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.face, color: MyColors.iconThemeColor),
        )
      ],
    );
  }
}
