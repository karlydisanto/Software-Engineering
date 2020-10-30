import 'package:fit4u/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fit4u/screens/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  //if true shows sign in screen otherwise show register screen
  bool showSignIn = true;

  //allows for back and forth to happen
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  }
}
