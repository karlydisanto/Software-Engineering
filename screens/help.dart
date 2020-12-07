import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/services/exercise_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fit4u/shared/constants.dart';
import 'package:fit4u/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/screens/exerciseList.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal[100],
          ),
          body: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10
                              ),
                              Text(
                                "Need Help?",
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Everthing you need to know so you can use Fit4U like a pro!",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 18),
                              ),

                              SizedBox(height:25),
                              Text('I can’t login to Fit4U, what should I do?',style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                              SizedBox(height:5),
                              Text('Please check your username and password. If they are correct, you might close Fit4u and try it again for one or two times.',style: TextStyle(
                                  fontSize: 14)),
                              SizedBox(height:25),
                              Text('I am unable to register, what should I do?',style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                              SizedBox(height:5),
                              Text('Please check that you are entering a valid email and password.',style: TextStyle(
                                  fontSize: 14)),
                              SizedBox(height:25),
                              Text('Is filling out the survey mandatory?',style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                              SizedBox(height:5),
                              Text('In order to experience the full functionality of the application, it is recommended that you fill out the survey.',style: TextStyle(
                                  fontSize: 14)),
                              SizedBox(height:25),
                              Text('If Fit4U crashes several times, what should I do?',style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                              SizedBox(height:5),
                              Text('Close it for a while. If this situation happens again, you can try to redownload it.',style: TextStyle(
                                  fontSize: 14)),
                              SizedBox(height:25),
                              Text('If I exit the Fit4U will I loose my workouts and personal data?',style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                              SizedBox(height:5),
                              Text('No, all user information is saved in a remote database',style: TextStyle(
                                  fontSize: 14)),





                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
          )
      );
    }
  }
