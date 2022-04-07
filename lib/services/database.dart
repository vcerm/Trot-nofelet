import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nofelet/models/item.dart';
import 'package:nofelet/models/user.dart';

class DatabaseService{

  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference _itemsCollection = FirebaseFirestore.instance.collection('items');
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users_info');

  Future updateUserData(String? newName, String? newEmail) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uID = auth.currentUser?.uid.toString();
    print(_usersCollection.doc(uID));
    print(newEmail);
    print(newName);
    return await _usersCollection.doc(uID).set({
      'name': newName,
      'email': newEmail,
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

  Future deleteItem(Item item) async{
    DocumentReference itemRef = _itemsCollection.doc(item.id);
    return itemRef.delete();
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
        return Item.fromJson(doc.id, doc.data() as Map<String, dynamic>);
      }).toList());
  }

  Stream<Item> get getItemById{
    print(_itemsCollection.doc(uid));
    return _itemsCollection.doc(uid).snapshots().map((DocumentSnapshot doc) => Item.fromJson(doc.id, doc.data() as Map<String, dynamic>));
  }

  Stream<UserData> get userData{
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uID = auth.currentUser?.uid.toString();
    return _usersCollection.doc(uID).snapshots().map((DocumentSnapshot doc) => UserData.fromJson(doc.id, doc.data() as  Map<String, dynamic>));
  }




}