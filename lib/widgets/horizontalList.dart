import 'package:flutter/material.dart';
import './buildCard.dart';

class HorizontalList extends StatelessWidget {
  final height, width;

  HorizontalList(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        BuildCard(
            'Arum Lily',
            'Zantedeschia',
            'https://thebigsky.smugmug.com/photos/i-k8sSnGN/0/X3/i-k8sSnGN-X3.jpg',
            height,
            width),
        BuildCard(
            'Forget-me-not',
            'Myosotis',
            'https://thebigsky.smugmug.com/photos/i-WFVwC5g/0/X3/i-WFVwC5g-X3.jpg',
            height,
            width),
        BuildCard(
            'Bleeding Heart',
            'Dicentra spectabilis',
            'https://thebigsky.smugmug.com/photos/i-WxbwBpX/0/X3/i-WxbwBpX-X3.jpg',
            height,
            width),
        BuildCard(
            'Grape Hyacinth ',
            '	Muscari',
            'https://thebigsky.smugmug.com/photos/i-WXgnkq2/0/X3/i-WXgnkq2-X3.jpg',
            height,
            width),
        BuildCard(
            'Peruvian lily',
            'Alstromeria',
            'https://thebigsky.smugmug.com/photos/i-fKqsHN4/0/X3/i-fKqsHN4-X3.jpg',
            height,
            width)
      ],
    );
  }
}
