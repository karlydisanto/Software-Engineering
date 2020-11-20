import 'package:fit4u/services/auth.dart';
import 'package:fit4u/shared/constants.dart';
import 'package:fit4u/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  //constructor for widget
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //to store the values being typed
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Sign in to Fit4U",
        style: TextStyle(
          color: Colors.teal
        ),
        ),
        actions: [FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text("Register")
        )
        ],
        ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle
                  ),
              ),
              SizedBox(height: 50),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChanged: (val) => email = val,
                decoration: textInputDecoration.copyWith(hintText: "Email", icon: Icon(Icons.mail)),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? "Enter a password greater than 6 characters" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                decoration: textInputDecoration.copyWith(hintText: "Password", icon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.teal,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = ("Could not log in with those credentials");
                        loading = false;
                       });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red,
                    fontSize: 14.0)
              ),
            ],
          ),
        )
      ),
    );
  }
}
