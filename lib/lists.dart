import "package:http/http.dart";
import "dart:convert";
import "package:cloud_firestore/cloud_firestore.dart";


// import "package:intl/intl.dart";

class Lists {
    
    String item;
    String description;
 


    Lists({this.item, this.description});

//future is used for async calls
  Future<void> getDataFromFirebase() async { 

      try{
        return await Firestore
         .instance
      .collection("records")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => f.data);
    
  });
        
      }
      catch(e) {
          return "failed to load time";
      }

}



}


