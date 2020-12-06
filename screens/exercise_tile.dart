import 'package:fit4u/screens/detail_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fit4u/models/exercise.dart';
import 'package:provider/provider.dart';

class ExerciseTile extends StatelessWidget {

  final Exercise theExercise;
  ExerciseTile({ this.theExercise });

  @override
  Widget build(BuildContext context) {

    void _showDetails() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: DetailBottomSheet(),
        );
      });
    }

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 8, 20, 6),
        child: ListTile(
          leading: Icon(Icons.fitness_center, size: 50),
          title: Text('${theExercise.name}'),
          trailing: Icon(Icons.more_vert),
          onTap: () {
            _showDetails();
          },
        ),
    ),

    );
  }
}
