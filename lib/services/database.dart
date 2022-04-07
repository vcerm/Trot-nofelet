import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nofelet/models/item.dart';
import 'package:nofelet/models/user.dart';

class DatabaseService{

  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference _itemsCollection = FirebaseFirestore.instance.collection('items');
  final CollectionReference _userItemsCollection = FirebaseFirestore.instance.collection('user_items');
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users_info');

  Future updateUserData(String name, String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uID = auth.currentUser?.uid.toString();
    return await _usersCollection.doc(uID).set({
      'name': name,
      'email': email,
    });
  }


  Future addOrUpdateItem(Item item) async {
    DocumentReference itemRef = _itemsCollection.doc(item.id);
    return itemRef.set({
      'Author' : item.author,
      'Description' : item.description,
      'AuthorID' : item.authorId
    });
  }

  Stream<List<Item>> getItems(String? author){
    Query query;
    if(author != null) {
      query = _itemsCollection.where('AuthorID', isEqualTo: author);
    } else {
      query = _itemsCollection;
    }
    return query.snapshots().map((QuerySnapshot data) =>
      data.docs.map((DocumentSnapshot doc) {
        print(doc.data());
        print(doc.id);
        return Item.fromJson(doc.id, doc.data() as Map<String, dynamic>);
      }).toList());
  }

  Future<Item> getItemById(String? id) async{
        var doc = await _itemsCollection.doc(id).get();
    return Item.fromJson(doc.id, doc.data() as Map<String, dynamic>);
  }

  Stream<UserData> get userData{
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uID = auth.currentUser?.uid.toString();
    return _usersCollection.doc(uID).snapshots().map((DocumentSnapshot doc) => UserData.fromJson(doc.id, doc.data as  Map<String, dynamic>));
  }


}