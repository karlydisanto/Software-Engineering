import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _gender;
  String _age;
  String _training;
  String _level;
  String _days;
  String _goals;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildGender() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'What is your gender (Male, Female, Other)?',),
      validator: (String value){
        if(value.isEmpty){
          return 'Gender is Required';
        }
        
      } ,
      onSaved: (String value){
        _gender = value;
      }
    );
  }

  Widget _buildAge() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'How old are you?'),
        keyboardType: TextInputType.number,
        validator: (String value){
          int age = int.tryParse(value);
          if(age == null || age <= 0){
            return 'Enter a valid age';
          }
        } ,
        onSaved: (String value){
          _gender = value;
        }
    );
  }

  Widget _buildTraining() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'What type of fitness training do you currently do? '),
        validator: (String value){
          if(value.isEmpty){
            return 'Fitness Training Type is Required';
          }
        } ,
        onSaved: (String value){
          _training = value;
        }
    );
  }

  Widget _buildLevel() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'How would you describe your level (Beginner, Intermediate, Advanced)?',),
        keyboardType: TextInputType.text,
        validator: (String value){
          if(value.isEmpty){
            return 'Level is Required';
          }
        } ,
        onSaved: (String value){
          _level = value;
        }
    );
  }

  Widget _buildDays() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'How many days a week do you usually workout?',),
        keyboardType: TextInputType.number,
        validator: (String value){
          int numDay = int.tryParse(value);
          if(numDay == null || numDay <= 0){
            return 'A number of days are required';
          }
        } ,
        onSaved: (String value){
          _days = value;
        }
    );
  }

  Widget _buildGoals() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'What are your fitness goal?',),
        keyboardType: TextInputType.number,
        validator: (String value){
          if(value.isEmpty){
            return 'Please enter your fitness goals';
          }
        } ,
        onSaved: (String value){
          _goals = value;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
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
                  style: TextStyle(color: Colors.blue, fontSize: 16,),
                ),
                onPressed: () {
                  if(!_formKey.currentState.validate()){
                    return;
                  }

                  _formKey.currentState.save();

                  print(_gender);
                  print(_age);
                  print(_training);
                  print(_level);
                  print(_days);
                  print(_goals);



                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
