import 'package:firebaseflutt/customform.dart';
import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";


// Create a Form widget.
class MyCustomList extends StatefulWidget {
  @override
  MyCustomListState createState() {
    return MyCustomListState();
  }
}


class  MyCustomListState extends State<MyCustomList> {


  List datalist;
   
      Future<void> fetchData() async { 
      try{
                var data = [];
        return await Firestore
         .instance
      .collection("records")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => {
        data.add(f.data),
      setState((){
        datalist = data;
      })
    }

    );
          // print(data);

  });
        
      }
      catch(e) {
        print("exceppttiooonnn");
          return "failed to load time";
      }

}



  void clearData(){
    setState(() {
      datalist= [];
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

                body:  Column(
                  children: <Widget> [
                    Expanded(child: 
                                   ListView.builder(
                  // shrinkWrap: true,
                  itemCount: datalist == null ?  0 :  datalist.length,
                  itemBuilder: (BuildContext context, int index) {
    return new Column(
      children: <Widget>[
    
        new ListTile(
          title: new Text(" ${datalist.elementAt(index)['item']}"),
          subtitle: new Text(" ${datalist.elementAt(index)['description']}"),
        ),
        new Divider(
          height: 2.0,
        ),


            ],
    );
     
                  }
                ),
                    ),
 

                 Padding(
                           padding: const EdgeInsets.all(50.0),

                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
            FlatButton(
  color: Colors.blue,
  textColor: Colors.white,
  disabledColor: Colors.grey,
  disabledTextColor: Colors.black,
  padding: EdgeInsets.all(8.0),
  splashColor: Colors.blueAccent,
  onPressed: fetchData,
  child: Text(
    "fetch data",
    style: TextStyle(fontSize: 20.0),
  ),
),
                              RaisedButton(
              onPressed: clearData,
              child: Text('clear'),
            ),
                  ])
                )
                
        
                  ]
                )
                

    );
  
  }
}