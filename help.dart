import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fit4u/shared/constants.dart';
import 'file:///C:/Users/kdisa/AndroidStudioProjects/fit4u/lib/widgets/search_bar.dart';
import 'package:fit4u/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit4u/screens/exerciseList.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().fit4u,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal[100],
            actions: [
              /*FlatButton.icon(
              icon: Icon(Icons.arrow_back),
                label: Text(""),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home())
                  );
                }
                )*/
            ],
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("exercises").snapshots(),
              builder: (context, snapshot) {
                return Stack(
                  children: <Widget>[
                    Container(
                      height: size.height * .45,
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        //image: DecorationImage(
                        // image: AssetImage("assets/images/meditation_bg.png"),
                        // fit: BoxFit.fitWidth,
                        // ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              Text(
                                "Need Help?",
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Here are some Frequently Asked Questions!",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
          )
      ),
    );
  }
}
