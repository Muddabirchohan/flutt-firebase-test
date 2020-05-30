import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebaseflutt/customform.dart";




class FireBaseCrud extends StatefulWidget {

  @override
  _FireBaseCrudState createState() => _FireBaseCrudState();
}

class _FireBaseCrudState extends State<FireBaseCrud> {


  String id;
  final db = Firestore.instance;
  final _fromkey = GlobalKey<FormState>();


  void showConnection(){
      final db = Firestore.instance;
      db.collection("records").add({'name': 'khan'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firstore appbar"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[

          RaisedButton(
            onPressed: showConnection,
            child: Text("show")
          )
        ],
      )
    );
  }
}