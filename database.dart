import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference surveyCollection = FirebaseFirestore.instance.collection('survey');

  Future updateUserData(String name, String gender, int age, String fitnessType, String fitnessLevel, int workoutDays, String goal) async {
    return await surveyCollection.doc(uid).set({
      "Name": name,
      "Gender": gender,
      "Age": age,
      "Fitness Type": fitnessType,
      "Fitness Level": fitnessLevel,
      "Workout Days": workoutDays,
      "Fitness Goal": goal
    });
  }
}
