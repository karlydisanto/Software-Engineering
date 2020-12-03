import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:fit4u/models/survey.dart';

class SurveyList extends StatefulWidget {
  @override
  _SurveyListState createState() => _SurveyListState();
}

class _SurveyListState extends State<SurveyList> {
  @override
  Widget build(BuildContext context) {
    final survey = Provider.of<List<Survey>>(context);
    survey.forEach((element) {
      print(element.name);
      print(element.gender);
      print(element.age);
      print(element.fitnessType);
      print(element.fitnessLevel);
      print(element.workoutDays);
      print(element.goal);
      print(element.exercises);
    });
    //print(exercises);
    return Container();
  }
}
