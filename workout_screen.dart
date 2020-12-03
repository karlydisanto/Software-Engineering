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
import 'package:fit4u/models/exercise.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamProvider<List<Exercise>>.value(
      value: DatabaseService().exercises,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal[100],
        ),
        body: ExerciseList(),
      ),
    );
  }
}
