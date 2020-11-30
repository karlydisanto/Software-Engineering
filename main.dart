import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DynamicWidget> listDynamic = [];

  addDynamic() {
    listDynamic.add(new DynamicWidget());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Fit4U Survey'),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Flexible(child: new ListView.builder(
                  itemCount: listDynamic.length,
                  itemBuilder: (_, index) => listDynamic[index])),
              new Container(
                width: 180.0,
                height: 120.0,
                child: new RaisedButton(onPressed: null,child: new Text('Submit Survey'),),
              )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(onPressed: addDynamic,
          child: new Icon(Icons.add),),
      ),
    );
  }

}

class DynamicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(23.0),
      child: new TextField(
        decoration: new InputDecoration(hintText: 'Enter Data'),
      ),
    );
  }

}
