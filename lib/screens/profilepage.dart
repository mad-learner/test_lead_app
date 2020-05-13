import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.green.withOpacity(0.8),
            ),
            clipper: getClipper(),
          ),
          Positioned(
            width: 300.0,
            left: 25.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage('https://miro.medium.com/max/3150/2*h6SvviiFGQO5N_RH4dVEPg.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(75.0),),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black,)
                    ],
                  ),
                ),
                SizedBox(height: 90.0),
                Text(
                  'Nishant',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Whats up Dude !',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 30.0,
                  width: 95.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blueAccent,
                    color: Colors.blue,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                        child: Center(
                          child: Text(
                            '19 y/o',
                            style: TextStyle(color: Colors.white, ),
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 30.0,
                  width: 95.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.pinkAccent,
                    color: Colors.pink,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                        child: Center(
                          child: Text(
                            'DU',
                            style: TextStyle(color: Colors.white, ),
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ), 
    );
  }
}

class getClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = new Path();
    
    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}