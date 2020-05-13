import 'package:flutter/material.dart';
import 'package:lead_india_nm/screens/authenticate/login.dart';
import 'package:lead_india_nm/screens/authenticate/register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true; 
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Register(),
    // );
    if (showSignIn) {
      return LogIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}