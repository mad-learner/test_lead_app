import 'package:flutter/material.dart';
import 'package:lead_india_nm/models/user.dart';
import 'package:lead_india_nm/screens/authenticate/authenticate.dart';
import 'package:lead_india_nm/screens/homepage.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // print(user);

    if(user == null) {
      return Authenticate();
    } else
    {
      return HomePage();
    }
  }
}