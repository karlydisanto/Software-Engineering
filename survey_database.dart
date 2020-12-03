import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:fit4u/models/survey.dart';

class DatabaseService2 {

  final String uid;

  DatabaseService2({this.uid});

  // collection reference
  final CollectionReference surveyCollection = FirebaseFirestore.instance.collection('survey');

  Future updateUserData(String name, String gender, int age, String fitnessType, String fitnessLevel, int workoutDays, String goal, String exercises) async {
    return await surveyCollection.doc(uid).set({
      "Name": name,
      "Gender": gender,
      "Age": age,
      "Fitness Type": fitnessType,
      "Fitness Level": fitnessLevel,
      "Workout Days": workoutDays,
      "Fitness Goal": goal,
      "Exercises Generated": exercises,
    });
  }

  //survey list from snapshot
  List<Survey> _surveyListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Survey(
      name: doc.data()['name'] ?? '',
      gender: doc.data()['gender'] ?? '',
      age: doc.data()['age'].toString() ?? 0,
      fitnessType: doc.data()['fitness type'] ?? '',
      fitnessLevel: doc.data()['fitness level'] ?? '',
      workoutDays: doc.data()['workout days'] ?? 0,
      goal: doc.data()['fitness goal'] ?? '',
      exercises: doc.data()['exercises'] ?? '',
    )).toList();
  }

  //get stream if documents changed
  Stream<List<Survey>> get survey {
    return surveyCollection.snapshots()
        .map(_surveyListFromSnapshot);

  }
}
