import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData {

  late String idEmployer, image, title, id;
  late bool done;

  TaskData.fromDocument(DocumentSnapshot document) {
    id = document.id;
    idEmployer = document.get("idEmployer");
    image = document.get("image");
    title = document.get("title"); 
    done = document.get("done");


    
  }

  
// List<ItemVariation> variations;
}