import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final name, botanicalName, imageLink, height, width;

  BuildCard(
      this.name, this.botanicalName, this.imageLink, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
            child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
          margin: EdgeInsets.only(left: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Image.network(imageLink,
              fit: BoxFit.cover, width: width * 280, height: height * 250),
        )),
        Positioned(
          left: 25,
          bottom: 28,
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: height * 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: 25,
          bottom: 12,
          child: Text(
            botanicalName,
            style: TextStyle(
              color: Colors.white,
              fontSize: height * 13,
            ),
          ),
        ),
      ],
    );
  }
}
