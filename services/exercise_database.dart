import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/models/exercise.dart';

class DatabaseService {

  final String category;

  DatabaseService({ this.category });

  //collection reference
  final CollectionReference exerciseCollection = FirebaseFirestore.instance
      .collection('exercises');

  Future updateExercises(String categoryName, String exercise1, String exercise2, String exercise3, String exercise4, String exercise5, String exercise6, String exercise7, String exercise8, String exercise9, String exercise10) async{
    return await exerciseCollection.doc(category);
  }

  //exercise list from snapshot
  List<Exercise> _exerciseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Exercise(
        name: doc.data()['name'] ?? '',
        exercise1: doc.data()['exercise1'] ?? '',
        exercise2: doc.data()['exercise2'] ?? '',
        exercise3: doc.data()['exercise3'] ?? '',
        exercise4: doc.data()['exercise4'] ?? '',
        exercise5: doc.data()['exercise5'] ?? '',
        exercise6: doc.data()['exercise6'] ?? '',
        exercise7: doc.data()['exercise7'] ?? '',
        exercise8: doc.data()['exercise8'] ?? '',
        exercise9: doc.data()['exercise9'] ?? '',
        exercise10: doc.data()['exercise10'] ?? '',
    )
    ).toList();
  }

  //exercise data from snapshot
  Exercise _exerciseDataFromSnapshot(DocumentSnapshot snapshot){
    return Exercise(
      name: snapshot.data()['name'],
      exercise1: snapshot.data()['exercise1'],
      exercise2: snapshot.data()['exercise2'],
      exercise3: snapshot.data()['exercise3'],
      exercise4: snapshot.data()['exercise4'],
      exercise5: snapshot.data()['exercise5'],
      exercise6: snapshot.data()['exercise6'],
      exercise7: snapshot.data()['exercise7'],
      exercise8: snapshot.data()['exercise8'],
      exercise9: snapshot.data()['exercise9'],
      exercise10: snapshot.data()['exercise10']
    );
  }

  //get exercise stream
  Stream<List<Exercise>> get exercises {
    return exerciseCollection.snapshots()
      .map(_exerciseListFromSnapshot);
}

  //get exercise doc stream
  Stream<Exercise> get exerciseData {
    return exerciseCollection.doc(category).snapshots()
        .map(_exerciseDataFromSnapshot);
}

}
