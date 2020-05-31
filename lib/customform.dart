import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";


// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";

  void sendData(){
               if (_formKey.currentState.validate()) {
        try {
             Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));

                   final db = Firestore.instance;
                   db.collection("records").add({
                     'name': name,
                     'email': email 
                   });
} on Exception catch (exception) {
  print("exception ${exception}");
} catch (error) {
  print("error ${error}");
}
                  //  If the form is valid, display a Snackbar.
       

                
                }
                _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
  children: <Widget>[
        Expanded(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("LOGIN", 
        style: TextStyle(
          letterSpacing: 10,
        fontSize: 50,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..color = Colors.blue[400],
          )
        )
        // child: Image.asset("assets/login.jpg",
        // height: 80,
        // width: 200
        // ),
      ),
    ),
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
                name = value;
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
                email = value;
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
        ],
      ),
    ),
      ),
    )
  ],
); 
    
    

  }
}