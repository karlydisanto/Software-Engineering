import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit4u/models/user.dart';
import 'package:fit4u/services/database.dart';
import 'package:flutter/material.dart';
class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on Firebase user
  TheUser _userFromFirebaseUser(User user){
    return user != null ? TheUser(uid: user.uid) : null;

  }
  //auth change user stream
  //everyone time a user signs in or signs out were going to get a response or
  // event of the current user that signed in or out
  Stream<TheUser> get user {
    return _auth.authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User user = credential.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
}
  //sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
  //register with email and password (create a user)
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData("none", "none", 0, "none", "none", 0, "none");
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
  
  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
  }
  catch(e){
      print(e.toString());
      return null;
  }
}
}
