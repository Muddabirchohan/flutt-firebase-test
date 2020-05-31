import "package:flutter/material.dart";
import "package:firebaseflutt/customform.dart";
import "package:firebaseflutt/googlesignin.dart";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = '';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(appTitle),
        //   backgroundColor: Colors.blue[20],
        // ),
        body: SignInDemo(),
      ),
    );
  }
}