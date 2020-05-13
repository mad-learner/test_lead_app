import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {

  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 16.0, 2.0, 14.0),
        child: CircleAvatar(
          backgroundColor: Colors.green,
          radius: 10.0,
          child: Icon(
            Icons.add, 
            size: 15.0, 
            color: Colors.white,
          ),
        ),
      ),
      Padding(padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),),   
      FlatButton(
        onPressed: () {}, 
        child: Text(
          'Add Post', 
          style: TextStyle(
            fontSize: 12, 
            color: Colors.white
          ),
        ),  
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.green,
      ), 
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topText,
        ],
      ),
    );
  }
}