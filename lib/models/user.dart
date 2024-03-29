import 'package:firebase_auth/firebase_auth.dart';
import 'item.dart';

// class User{
//   final String photo;
//   final String name;
//   final String email;
//   final String password;
//   final List<Item> items;
//   final int id;
//
//   const User({required this.id, required this.name, required this.email, required this.password, required this.photo, required this.items});
// }

class UserPerson {
  String? id;
  String? email;

  UserPerson({this.id, this.email});

  UserPerson.fromFirebase(User user){
    id = user.uid;
    email = user.email;
  }


  UserPerson.fromJson(String uid, Map<String, dynamic> data) {
    id = uid;
    email = data['email'];
  }
}

class UserData{
  String? id;
  String? email;
  String? name;

  UserData({this.id,this.email,this.name});

  UserData.fromJson(String uid, Map<String, dynamic> data) {
    id = uid;
    email = data['email'];
    name = data['name'];
  }
}