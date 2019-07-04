import 'package:flutter/material.dart';
import '../assets/colors.dart';

class BuildPopularList extends StatelessWidget {
  final name, imageLink, height;

  BuildPopularList(this.name, this.imageLink, this.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageLink)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Torsten Paulsson',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        Container(
          height: height * 20,
          width: height * 55,
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MyColors.ribbonColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
          ),
          child: Text(
            'Hot',
            style: TextStyle(
                fontSize: height * 20,
                color: Colors.white,
                backgroundColor: MyColors.ribbonColor),
          ),
        )
      ],
    );
  }
}
