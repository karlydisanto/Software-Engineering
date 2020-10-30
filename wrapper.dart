import 'file:///C:/Users/kdisa/AndroidStudioProjects/fit4u/lib/screens/authenticate.dart';
import 'file:///C:/Users/kdisa/AndroidStudioProjects/fit4u/lib/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fit4u/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //accessing user data and if signed out return null
    final user = Provider.of<TheUser>(context);

    //return either home or authenticate widget
    if(user == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
