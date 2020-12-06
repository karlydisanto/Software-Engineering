import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/services/exercise_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fit4u/screens/exerciseCategoryList.dart';
import 'package:fit4u/models/exercise.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Exercise>>.value(
      initialData: List(),
      value: DatabaseService().exercises,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Lets Workout!',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            elevation: 0.0,
            backgroundColor: Colors.teal[100],
          ),
          body: ExerciseCategoryList(),
          backgroundColor: Colors.teal[50],
        ),
    );
  }
}
