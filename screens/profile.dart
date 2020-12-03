import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/models/profile.dart';
import 'package:fit4u/screens/surveyList.dart';
import 'package:fit4u/services/auth.dart';
import 'package:fit4u/services/database.dart';
import 'package:fit4u/services/survey_database.dart';
import 'package:flutter/material.dart';
import 'package:fit4u/shared/constants.dart';
import 'package:fit4u/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/screens/exerciseList.dart';
import 'package:fit4u/models/survey.dart';
import 'dart:io';

import '../locator.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  final AuthService _auth = locator.get<AuthService>();
  Profile _profile;

@override
void initState(){
  super.initState();
  // getting user profile record for current user
  _getProfile().then((value) {
    setState(() {
    });
  });
}
  Future<void> _getProfile() async{
  // getting from firebase.
    _profile = await DatabaseService3(uid : _auth.currentUser.uid).getProfile();
    // creating new user profile object if user is new and doesn't have profile record
    if(_profile==null) _profile = Profile();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildGender() {
    return TextFormField(
      initialValue: _profile.gender??'',
        decoration: InputDecoration(labelText: 'What is your gender (Male, Female, Other)?',),
        validator: (String value){
          if(value.isEmpty){
            return 'Gender is Required';
          }
return null;
        } ,
        onSaved: (String value){
         _profile.gender = value;
        }
    );
  }

  Widget _buildAge() {
    return TextFormField(
      initialValue: _profile.age?.toString()??'',
        decoration: InputDecoration(labelText: 'How old are you?'),
        keyboardType: TextInputType.number,
        validator: (String value){
          int age = int.tryParse(value);
          if(age == null || age <= 0){
            return 'Enter a valid age';
          }
          return null;
        } ,
        onSaved: (String value){
          _profile.age = int.tryParse(value);
        }
    );
  }

  Widget _buildTraining() {
    return TextFormField(
        initialValue: _profile.training??'',
        decoration: InputDecoration(labelText: 'What type of fitness training do you currently do? '),
        validator: (String value){
          if(value.isEmpty){
            return 'Fitness Training Type is Required';
          }
          return null;
        } ,
        onSaved: (String value){
          _profile.training = value;
        }
    );
  }

  Widget _buildLevel() {
    return TextFormField(
      initialValue: _profile.level??'',
        decoration: InputDecoration(labelText: 'How would you describe your level (Beginner, Intermediate, Advanced)?',),
        keyboardType: TextInputType.text,
        validator: (String value){
          if(value.isEmpty){
            return 'Level is Required';
          }
          return null;
        } ,
        onSaved: (String value){
          _profile.level = value;
        }
    );
  }

  Widget _buildDays() {
    return TextFormField(
      initialValue: _profile.days?.toString()??'',
        decoration: InputDecoration(labelText: 'How many days a week do you usually workout?',),
        keyboardType: TextInputType.number,
        validator: (String value){
          int numDay = int.tryParse(value);
          if(numDay == null || numDay <= 0){
            return 'A number of days are required';
          }
          return null;
        } ,
        onSaved: (String value){
          _profile.days = int.tryParse(value);
        }
    );
  }

  Widget _buildGoals() {
    return TextFormField(
      initialValue: _profile.goals??'',
        decoration: InputDecoration(labelText: 'What are your fitness goal?',),
        keyboardType: TextInputType.number,
        validator: (String value){
          if(value.isEmpty){
            return 'Please enter your fitness goals';
          }
          return null;
        } ,
        onSaved: (String value){
          _profile.goals = value;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey"),
        backgroundColor: Colors.teal,
      ),
      // showing loading progress indicator while profile data is being fetched.
      body: _profile == null ? Center(child: CircularProgressIndicator(),):
      Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildGender(),
                SizedBox(height: 30,),
                _buildAge(),
                SizedBox(height: 30,),
                _buildTraining(),
                SizedBox(height: 30,),
                _buildLevel(),
                SizedBox(height: 30,),
                _buildDays(),
                SizedBox(height: 30,),
                _buildGoals(),
                SizedBox(height: 30,),
                SizedBox(height: 50),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black, fontSize: 16,),
                  ),
                  onPressed: () async {
                    if(!_formKey.currentState.validate()){
                      return;
                    }

                    _formKey.currentState.save();

// saving data to firebase.
                    await DatabaseService3(uid:_auth.currentUser.uid).updateUserData(_profile);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
