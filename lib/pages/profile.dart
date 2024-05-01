import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthyfitapp/model/myuser_model.dart';
import 'package:healthyfitapp/services/auth.dart';
import 'package:healthyfitapp/services/database.dart';
import 'package:healthyfitapp/services/favdb.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  final TextEditingController _namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var useruid = Provider.of<UserModel?>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout, semanticLabel: "aa"),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(26),
            child: FutureBuilder(
              future: DatabaseService.getUserByEmail(
                  _authService.getCurrentUser()!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  DocumentSnapshot user = snapshot.data![0];
                  if (user['role'] == 'Admin') {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                        ),
                        const SizedBox(height: 14),
                        Text(user['email'] ?? 'Kosong', style: TextStyle()
                            // TextStyleApp.titleRegular12
                            //     .copyWith(color: Colors.black, letterSpacing: 0.3),
                            ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _namaController,
                          decoration: InputDecoration(
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              alignLabelWithHint: true,
                              hintText: user['nama'] == ''
                                  ? 'Tolong inputkan nama anda'
                                  : user['nama']),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () {
                            DatabaseService(uid: useruid?.uid)
                                .updateUserNama(_namaController.text);
                          },
                          child: const Text("Update Nama"),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/AdminSaranDoa');
                          },
                          child: const Text("Halaman Edit Doa"),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/AdminFeeling');
                          },
                          child: const Text("List Feeling"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // await FavDB()
                            //     .insertData("ini title", "ini doa", "ini waktu");
                            await SQLHelper.createItem(
                                "ini title", "ini doa", "ini waktu");
                            print("data inserted");
                          },
                          child: const Text("Insert"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final data = await SQLHelper.getItems();
                            if (kDebugMode) {
                              print(data);
                            }
                          },
                          child: const Text("Fetch"),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                        ),
                        const SizedBox(height: 14),
                        Text(user['email'], style: TextStyle()),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _namaController,
                          decoration: InputDecoration(
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              alignLabelWithHint: true,
                              hintText: user['nama'] == ''
                                  ? 'Tolong inputkan nama anda'
                                  : user['nama']),
                        ),
                        const SizedBox(height: 14),
                        const SizedBox(height: 14),
                        ElevatedButton(
                            onPressed: () {
                              DatabaseService(uid: useruid?.uid)
                                  .updateUserNama(_namaController.text);
                            },
                            child: const Text("Update Nama"))
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text('Error retrieving user data: ${snapshot.error}');
                } else {
                  return const Text("Loading...");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
