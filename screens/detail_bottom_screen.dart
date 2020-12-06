import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit4u/models/exercise.dart';
import 'package:fit4u/services/exercise_database.dart';
import 'package:fit4u/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailBottomSheet extends StatefulWidget {
  @override
  _DetailBottomSheetState createState() => _DetailBottomSheetState();
}

class _DetailBottomSheetState extends State<DetailBottomSheet> {

  @override
  Widget build(BuildContext context) {

    final exercise = Provider.of<Exercise>(context);

    return StreamBuilder<Exercise>(
      stream: DatabaseService(category:
          'lacrosse'
          //'cardio'
        /*exercise.name*/).exerciseData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          Exercise exerciseData = snapshot.data;
          return Container(
            height: 1000,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
                  child: Column(
                    children: [
                      //Text('${exerciseData.categoryName}'),
                      Text('${exerciseData.exercise1}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise2}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise3}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise4}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise5}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise6}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise7}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise8}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise9}', textScaleFactor: 1.5,),
                      Text('${exerciseData.exercise10}', textScaleFactor: 1.5,),
                    ],
                  ),
                );
              },
            ),
          );
        }
        else {
          return Loading();
        }
      }
    );
  }
}
