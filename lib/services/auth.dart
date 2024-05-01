import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:healthyfitapp/model/myuser_model.dart';
import 'package:healthyfitapp/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  UserModel _userFromFirebaseUser(User? user) {
    if (user == null) {
      return UserModel(uid: 'null');
    }
    return UserModel(uid: user.uid);
  }

  // auth change user stream
  Stream<UserModel> get user {
    var a = _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user!));
        .map(_userFromFirebaseUser);
    print(a);
    return a;
  }

  // sign in anon
  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // User user = result.user!;

      return result.user;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData(email);
      return _userFromFirebaseUser(user);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }

  String? getCurrentUser() {
    try {
      User? user = _auth.currentUser;
      return user?.email;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<void> deleteUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.delete();
  }
}
