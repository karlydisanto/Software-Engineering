import 'package:fit4u/locator.dart';
import 'package:fit4u/models/exercise.dart';
import 'package:fit4u/services/auth.dart';
import 'package:fit4u/services/exercise_database.dart';
import 'package:fit4u/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:fit4u/models/user.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator(); // setting up authservice object
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // getting from locator
  AuthService _auth = locator.get<AuthService>();

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        StreamProvider<TheUser>.value(value: _auth.user),
        StreamProvider<Exercise>.value(value: DatabaseService().exerciseData)
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
      /*
      StreamProvider<TheUser>.value(
      value: _auth.user,

    );*/
  }
}
