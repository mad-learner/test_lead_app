import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  List<String> _comments = [];

  void _addComments(String val){
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList(){
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _comments.length){
          return _buildCommentItem(_comments[index]);
        }
      }
    );
  }

  Widget _buildCommentItem(String comment){
    return ListTile(title: Text(comment));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comments"), backgroundColor: Colors.green,),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentList()
          ),
          TextField(
            onSubmitted: (String submittedStr)
            {
              _addComments(submittedStr);                      
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Add a comment..."
            ),
          ),
        ],
      ),
      
    );
  }
}