import 'package:flutter/material.dart';
import 'package:lead_india_nm/screens/wrapper.dart';
// import '../screens/login.dart';
import '../widgets/slide_dots.dart';
import '../models/slide.dart';
import '../widgets/slide_item.dart';
import 'dart:async';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0
  );

@override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      }else
      {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage, 
        duration: Duration(milliseconds: 300), 
        curve: Curves.easeIn);
    });
  }

@override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

_onPageChanged(int index) {
  setState(() {
    _currentPage = index;
  });
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white10],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 110.0, 20.0, 0.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: slideList.length,
                        itemBuilder: (ctx, i) => SlideItem(i),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 60.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                for(int i = 0;i<slideList.length;i++)
                                if(i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)   
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), 
                ),
              ],
            ),
          ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wrapper()),
                          );
                        }, 
                        child: Text('Getting Started', style: TextStyle(fontSize: 18, color: Colors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.green,
                        padding: const EdgeInsets.all(10.0),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Text(
                      //       'Have an Account ?', 
                      //       style: TextStyle(fontSize: 10),
                      //     ),
                      //     FlatButton(
                      //       onPressed: () {}, 
                      //       child: Text('LogIn', style: TextStyle(color: Colors.green),),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              
        ],
      ),
    );
  }
}



