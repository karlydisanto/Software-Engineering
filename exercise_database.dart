import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/models/exercise.dart';
import 'package:flutter/material.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference exerciseCollection = FirebaseFirestore.instance.collection('exercises');

  Future updateUserData(String exercises) async {
    return await exerciseCollection.doc(uid).set({
      "Exercises Generated": exercises
    });
  }

  //exercise list from snapshot
  List<Exercise> _exerciseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Exercise(
      exercises: doc.data()['exercises'] ?? '',
    )).toList();
  }

  //get stream if documents changed
  Stream<List<Exercise>> get exercises {
    return exerciseCollection.snapshots()
        .map(_exerciseListFromSnapshot);
  }
}
