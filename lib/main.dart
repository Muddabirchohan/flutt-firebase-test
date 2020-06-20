import "package:flutter/material.dart";
import "package:firebaseflutt/customform.dart";
import "package:firebaseflutt/tabs.dart";

import "package:firebaseflutt/googlesignin.dart";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = '';

    return MaterialApp(
      title: appTitle,
          initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => SignInDemo(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/firebase': (context) => TabBarDemo(),
    },
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text(appTitle),
      //   //   backgroundColor: Colors.blue[20],
      //   // ),
      //   body: SignInDemo(),
      // ),
    );
  }
}