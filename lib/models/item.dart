

import 'package:flutter/material.dart';

class Item {
  String? description;
  String? author;
  String? id;
  String? userEmail;
  String? authorId;

  Item({this.id, this.author, this.description, this.userEmail});

  Item.fromJson(String uid, Map<String, dynamic> data) {
    id = uid;
    author = data['Author'];
    description = data['Description'];
    userEmail = data['UserEmail'];
  }


  @override
  String toString() {
    return 'Item{description: $description, author: $author, id: $id, authorId: $authorId}';
  }

  Item copy(){
    final copiedAuthor = author;
    final copiedDecs = description;
    final copiedUserEmail = userEmail;

    return Item(id: id, author: copiedAuthor, description: copiedDecs, userEmail: copiedUserEmail);
  }
}