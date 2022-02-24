import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData {
  late String idEmployer, image, title, id;
  late bool done;

  late int cod;
  late String project;
  late String description;

  TaskData.fromDocument(DocumentSnapshot document) {
    id = document.id;
    idEmployer = document.get("idEmployer");
    image = document.get("image");
    title = document.get("title");
    done = document.get("done");

    cod = document.get("cod");
    project = document.get("project");
    description = document.get("description");
  }

// List<ItemVariation> variations;
}
