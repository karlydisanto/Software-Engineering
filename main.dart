import 'package:fit4u/services/auth.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return StreamProvider<TheUser>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
        ),
      );
  }
}
