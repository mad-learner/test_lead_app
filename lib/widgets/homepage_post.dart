import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lead_india_nm/screens/profilepage.dart';
import 'package:lead_india_nm/widgets/add_post.dart';
import 'package:lead_india_nm/widgets/comments.dart';

class HomePagePost extends StatefulWidget {
  @override
  _HomePagePostState createState() => _HomePagePostState();
}

class _HomePagePostState extends State<HomePagePost> {
  bool liked = false;
  bool showHeartOverlay = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  _doubleTapped() {
    setState(() {
      showHeartOverlay = true;
      liked = true;
      if(showHeartOverlay) {
        Timer(const Duration(milliseconds: 500), ()
          {
            setState(() {
              showHeartOverlay = false;
            });
          } 
        );
      }
    });
  }

  _commentButtonPressed() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index)=> index == 0 ? 
      
      SizedBox(
        child: AddPost(),
        height: deviceSize.height  * 0.110,
      ) 
      
      : Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 550,
              // width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow (
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 3
                      3.0, // vertical , move down 10
                    ),
                  ),
                ],
                // border: Border.all(
                //   color: Colors.white,
                // ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
            
            // 1st Row

            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfilePage(),),
                            );
                          }, 
                          child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://miro.medium.com/max/3150/2*h6SvviiFGQO5N_RH4dVEPg.jpeg',
                              ),
                            ),
                          ),
                        ),
                        ),
                        // SizedBox(
                        //   width: 10.0,
                        // ),
                        Text(
                          "Nishant",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert), 
                      onPressed: null,
                    ),
                  ],
                ),
            ),

            // 2nd Row

            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 2.0, 0.0, 2.0),
                child: Text(
                  'Sustainability requires a company to look both internally and externally to understand their environment and social impacts',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold, 
                    color: Colors.black54,
                  ),
                ),
            ),

            // 3rd Row

            Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 2.0, 13.0, 0.0),
                child: Column(
                  children: [
                    //PostHeader(),
                    GestureDetector(
                      onDoubleTap: () => _doubleTapped(),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.network(
                            "https://i0.wp.com/cdn-prod.medicalnewstoday.com/content/images/articles/325/325466/man-walking-dog.jpg?w=1155&h=1541",
                          ),
                          showHeartOverlay ? Icon(Icons.favorite, color:Colors.white, size: 80.0) : Container(),
                        ],
                      ),
                    ),
                  ],               
                ),
            ),

            // 4th Row

            Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 16.0, 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(liked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.solidHeart, 
                          color: liked ? Colors.red : Colors.black87,
                        ),
                          onPressed: () => _pressed(), 
                        ),
                        // SizedBox(
                        //   width: 2.0,
                        // ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.solidCommentDots),
                          onPressed: () => _commentButtonPressed(),
                        ),
                        // SizedBox(
                        //   width: 12.0,
                        // ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.solidPaperPlane),
                          onPressed: () {
                            //  color: Colors.pink;
                          },
                        ),
                      ],
                    ),
                    Icon(
                          FontAwesomeIcons.bookmark,
                    ),
                  ],
                ),
            ),

            // 5th Row

            Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Liked by shinchan and 100 others",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                ),
            ),

            // 6th Row

            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 6.0, 0.0, 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://miro.medium.com/max/3150/2*h6SvviiFGQO5N_RH4dVEPg.jpeg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        // onSubmitted: (String submittedStr)
                        // {
                        //   CommentsPage._addComments(submittedStr);                      
                        // },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a comment..."
                        ),
                      ),
                    ),
                  ],
                ),
            ),

            // 7th Row

            Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 2.0),
                child: Text(
                  "1 March 2020",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
            ),
                ],
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}