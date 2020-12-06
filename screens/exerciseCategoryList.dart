import 'package:fit4u/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/screens/exercise_tile.dart';

class ExerciseCategoryList extends StatefulWidget {
  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseCategoryList> {

  @override
  Widget build(BuildContext context) {

    final exercise = Provider.of<List<Exercise>>(context) ?? [];

    return ListView.builder(
      itemCount: exercise.length,
      itemBuilder: (context, index) {
        return ExerciseTile(theExercise: exercise[index]);
      },
    );
  }
}
