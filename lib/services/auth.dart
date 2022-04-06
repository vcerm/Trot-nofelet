
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nofelet/models/user.dart';

class AuthService{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<UserPerson?> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserPerson.fromFirebase(user!);
    }catch(e){
      return null;
    }
  }

  Future<UserPerson?> registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserPerson.fromFirebase(user!);
    }catch(e){
      return null;
    }
  }

  Future logOut() async{
    try{
    await _fAuth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Stream<UserPerson?> get currentUser{
    return FirebaseAuth.instance.authStateChanges()
        .map((User? user) => user != null ? UserPerson.fromFirebase(user) : null);
  }

}