import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthyfitapp/services/auth.dart';

final CollectionReference _user =
    FirebaseFirestore.instance.collection('users'); 
final CollectionReference _doa = FirebaseFirestore.instance.collection('doas');
final CollectionReference _feeling =
    FirebaseFirestore.instance.collection('feelings');
final AuthService _authService = AuthService();

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  Future<void> updateUserData(String email) async {
    return await _user.doc(uid).set(
      {'email': email, 'nama': '', 'role': "User"},
    );
  }

  Future<void> updateUserNama(String nama) async {
    return await _user.doc(uid).update({'nama': nama});
  }

  Future<void> createFeeling(
      {required String feeling,
      required String feelingDetail,
      required String kategori}) async {
    var email = _authService.getCurrentUser();
    return await _feeling.doc().set(
      {
        'feeling': feeling,
        'feelingDetail': feelingDetail,
        'kategori': kategori,
        'user': email
      },
    );
  }

  // get userData stream
  Stream<QuerySnapshot> getUsers() {
    return _user.snapshots();
  }

  //get doas stream
  Stream<QuerySnapshot> getDoas() {
    return _doa.snapshots();
  }

  //get feeling stream
  Stream<QuerySnapshot> getFeeling() {
    return _feeling.snapshots();
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getUserByEmail(
      String email) {
    return _user
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs);
  }
}
