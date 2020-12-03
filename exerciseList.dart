import 'package:fit4u/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:fit4u/models/exercise.dart';

class ExerciseList extends StatefulWidget {
  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  @override
  Widget build(BuildContext context) {
    final exercises = Provider.of<List<Exercise>>(context);
    exercises.forEach((exercise) {
      print(exercise.exercises);
    });
    //print(exercises);
    return Container();
  }
}
