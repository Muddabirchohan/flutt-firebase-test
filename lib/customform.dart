import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebaseflutt/lists.dart";
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  String item = "";
  String description = "";

//   List datalist;
   
//       Future<void> getDataFromFirebase() async { 
//       try{
//                 var data = [];
//         return await Firestore
//          .instance
//       .collection("records")
//       .getDocuments()
//       .then((QuerySnapshot snapshot) {
//     snapshot.documents.forEach((f) => {
//         data.add(f.data),
//       setState((){
//         datalist = data;
//       })
//     }

//     );
//           // print(data);

//   });
        
//       }
//       catch(e) {
//         print("exceppttiooonnn");
//           return "failed to load time";
//       }

// }




  // void clearData(){
  //   setState(() {
  //     datalist= [];
  //   });
  // }



  void sendData(){
               if (_formKey.currentState.validate()) {
        try {
                   final db = Firestore.instance;
                   db.collection("records").add({
                     'item': item,
                     'description': description 
                   });
} on Exception catch (exception) {
  print("exception ${exception}");
} catch (error) {
  print("error ${error}");
}
                
                }
                _formKey.currentState.reset();
  }


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
                resizeToAvoidBottomPadding: false,
        body:  Column(
  children: <Widget>[

    Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                item = value;
              });
              return null;
            },
          ),
             TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                description = value;
              });
              return null;
            },
          ),
          Padding(

            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: RaisedButton(
              onPressed: sendData,
              child: Text('Submit'),
            )
            ), 
          ),
          //  Padding(

          //   padding: const EdgeInsets.symmetric(vertical: 1.0),
          //   child: Column(
          //     children: <Widget>[ RaisedButton(
          //     onPressed: getDataFromFirebase,
          //     child: Text('fetch'),
          //   ),
          //   RaisedButton(
          //     onPressed: clearData,
          //     child: Text('clear'),
          //   ),


          //     ]
          //   ), 
          // ),
        ],
      ),
    ),
      ),
    ),
    //        Expanded(
    //             child: ListView.builder(
    //               // shrinkWrap: true,
    //               itemCount: datalist == null ?  0 :  datalist.length,
    //               itemBuilder: (BuildContext context, int index) {
    // return new Column(
    //   children: <Widget>[
    //     new ListTile(
    //       title: new Text(" ${datalist.elementAt(index)['item']}"),
    //       subtitle: new Text(" ${datalist.elementAt(index)['description']}"),
    //     ),
    //     new Divider(
    //       height: 2.0,
    //     ),
    //   ],
    // );
    //               }
    //             ),
    // ),

  ],

)
      ); 
  }
}