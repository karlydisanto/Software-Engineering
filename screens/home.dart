import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fit4u/services/exercise_database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/screens/exerciseCategoryList.dart';
import 'package:fit4u/screens/profile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fit4u/screens/workout_screen.dart';
import 'package:fit4u/screens/help.dart';
import 'package:fit4u/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size; //this gonna give us total height and with of our device
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService3().profile,
      child: Scaffold(
        appBar: AppBar (
          title: Text("Fit4U",
            style: TextStyle(
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.teal[50],
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
        body: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Colors.teal[50],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage(""),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome to Fit4U!",
                      textAlign: TextAlign.center,
                      style: Theme
                          .of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),

                    ),
                    Row(
                      children: [
                        SizedBox(height: 100,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 190,
                          width: 170,
                          child: Container(
                            color: Colors.grey[400],
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: BorderSide(color: Colors.black)
                                ),
                                padding: EdgeInsets.only(top: 50,),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.fitness_center),
                                      iconSize: 50,
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      "Begin Workout",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => WorkoutScreen())
                                  );
                                }
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        SizedBox(
                          height: 190,
                          width: 170,
                          child: Container(
                            color: Colors.grey[400],
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: BorderSide(color: Colors.black)
                                ),
                                padding: EdgeInsets.only(top: 50,),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.settings),
                                      iconSize: 50,
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      "Help",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => HelpPage())
                                  );
                                }
                            ),
                          ),
                        ),
                      ], //children
                    ),
                    Row(
                      children: [
                        SizedBox(height: 20),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 190,
                          width: 170,
                          child: Container(
                            color: Colors.grey[400],
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    side: BorderSide(color: Colors.black)
                                ),
                                padding: EdgeInsets.only(top: 50,),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.person),
                                      iconSize: 50,
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => FormScreen())
                                  );
                                }
                            ),
                          ),
                        ),
                      ], //children
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
