import'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/models/profile.dart';
import 'package:fit4u/screens/profile.dart';
import 'dart:io';


class DatabaseService3{
  final String uid;
  DatabaseService3({this.uid});

  //colection refrence
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profile');

  // getting profile information for given user.
    Future<Profile> getProfile() async{
      var data =  await profileCollection.doc(uid).get();
      if(data.exists)
        return Profile.fromJson(data.data());
      return null;
    }

    // updating profile collection for the current user
  Future updateUserData(Profile profile) async{
    return await profileCollection.doc(uid).set(profile.toJson(), SetOptions(merge:true));
  }

  // get profle streams
Stream<QuerySnapshot> get profile {
    return profileCollection.snapshots();
}
}


