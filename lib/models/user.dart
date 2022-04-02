import 'item.dart';

class User{
  String photo;
  String name;
  String email;
  String password;
  List<Item> items;
  int id;

  User({required this.id, required this.name, required this.email, required this.password, required this.photo, required this.items});
}