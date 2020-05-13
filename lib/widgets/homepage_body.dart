import 'package:flutter/material.dart';
import 'package:lead_india_nm/widgets/homepage_post.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(child: HomePagePost())
      ],    
    );
  }
}