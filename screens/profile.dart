import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/screens/surveyList.dart';
import 'package:fit4u/services/survey_database.dart';
import 'package:flutter/material.dart';
import 'package:fit4u/shared/constants.dart';
import 'package:fit4u/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/screens/exerciseList.dart';
import 'package:fit4u/models/survey.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamProvider<List<Survey>>.value(
      value: DatabaseService2().survey,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal[100],
        ),
        body: SurveyList(),
      ),
    );
  }
}
