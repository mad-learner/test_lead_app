import 'package:flutter/material.dart';
import 'package:lead_india_nm/screens/HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lead_india_nm/screens/profile_page.dart';
//import 'package:lead_india_nm/screens/profilepage.dart';
//import 'package:lead_india_nm/screens/welcome.dart';
import 'package:lead_india_nm/services/auth.dart';

class MainDrawer extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(0.0, 30.0,0.0, 30.0),
            color: Colors.green,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile_Page()),
                      );
                    } , 
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 30.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://miro.medium.com/max/3150/2*h6SvviiFGQO5N_RH4dVEPg.jpeg'
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                    Text(
                      'RAHUL', 
                      style: TextStyle(
                        fontSize: 16.0, 
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'ABC@gmail.com', 
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6.0, 30.0, 0.0, 0.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage(),),
                      );
                    },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.fromLTRB(6.0, 30.0, 0.0, 0.0),),
          ListTile(
            leading: Icon(FontAwesomeIcons.calendarPlus, color: Colors.green,),
            title: Text('Agenda', style: TextStyle(fontSize: 16.0),),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage(),),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts, color: Colors.green,),
            title: Text('Partners', style: TextStyle(fontSize: 16.0),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.star, color: Colors.green,),
            title: Text('Sponsors', style: TextStyle(fontSize: 16.0),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.linkedin, color: Colors.green,),
            title: Text('LinkedIn feeds', style: TextStyle(fontSize: 16.0),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.facebook, color: Colors.green,),
            title: Text('Facebook feeds', style: TextStyle(fontSize: 16.0),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.twitter, color: Colors.green,),
            title: Text('Twitter feeds', style: TextStyle(fontSize: 16.0),),
            onTap: null,
          ),
          Padding(padding: const EdgeInsets.only(top: 120.0),),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green,),
            title: Text('Settings', style: TextStyle(fontSize: 16.0),),
            onTap: null,
          ),
          Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          // Navigator.push(context,
                          // MaterialPageRoute(builder: (context) => Welcome()),
                          // );
                          await _auth.signOut();
                        }, 
                        child: Text('Logout', style: TextStyle(fontSize: 18, color: Colors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        color: Colors.green,
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}