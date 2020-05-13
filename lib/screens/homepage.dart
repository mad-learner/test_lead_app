import 'package:flutter/material.dart';
import 'package:lead_india_nm/screens/main_drawer.dart';
// import 'package:lead_india_nm/screens/profilepage.dart';
import 'package:lead_india_nm/widgets/homepage_body.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final topBar = AppBar(
    backgroundColor: Colors.green,
    centerTitle: true,
    elevation: 1.0,
    //leading: Icon(Icons.list, color: Colors.white,),
    title: SizedBox(
      height: 60.0,
      child: Image.asset("assets/images/Welcome2.jpg"),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // FlatButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => ProfilePage(),),
                //     );
                //   }, 
                //   child: 
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
                // ),
              ],
        ),  
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      drawer: MainDrawer(),
      body: HomePageBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Camera'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Messages'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            backgroundColor: Colors.redAccent,
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //  Container(
      //   color: Colors.green,
      //   height: 50.0,
      //   alignment: Alignment.center,
      //   child: BottomAppBar(
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: <Widget>[
      //         IconButton(
      //           icon: Icon(Icons.home),
      //           onPressed: () {}
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.search),
      //           onPressed: () {}
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.camera),
      //           onPressed: () {}
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.chat),
      //           onPressed: () {}
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.settings),
      //           onPressed: () {}
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}