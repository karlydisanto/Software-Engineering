import 'package:fit4u/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar (
        title: Text("Fit4U",
        style: TextStyle(
          color: Colors.black
        ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              onPressed: () async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Log out")
          )
        ],
      ),
    );
  }
}
