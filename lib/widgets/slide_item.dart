import 'package:flutter/material.dart';
import '../models/slide.dart';

class SlideItem extends StatelessWidget {

  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
        ),
        Text(
          slideList[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20.0)
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }
}