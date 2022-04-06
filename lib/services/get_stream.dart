import 'package:firebase_auth/firebase_auth.dart';
import 'package:nofelet/models/user.dart';

class GetStream{
  Stream<UserPerson?> get currentUser{
    return FirebaseAuth.instance.authStateChanges()
        .map((User? user) => user != null ? UserPerson.fromFirebase(user) : null);
  }
}