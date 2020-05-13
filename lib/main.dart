import 'package:flutter/material.dart';
import 'package:lead_india_nm/models/user.dart';
import 'package:lead_india_nm/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/welcome.dart';

void main() => runApp(MyApp(
  // title: 'Lead India',
  // // theme: ThemeData(
  // //   primaryColor: Colors.white,
  // //   accentColor: Colors.white,
  // // ),
  // debugShowCheckedModeBanner: false,
  // home: Welcome(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
       home: Welcome(),
       debugShowCheckedModeBanner: false,
      ),
    );
  }
}