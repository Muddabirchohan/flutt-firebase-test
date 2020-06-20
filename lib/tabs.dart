import 'package:firebaseflutt/ListItems.dart';
import "package:flutter/material.dart";
import "package:firebaseflutt/customform.dart";


class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
                          resizeToAvoidBottomPadding: false,

          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MyCustomForm(),
              MyCustomList(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}