import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthyfitapp/pages/edit_doa.dart';
import 'package:healthyfitapp/pages/tambah_doa.dart';
import 'package:healthyfitapp/services/database.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class AdminSaranDoa extends StatelessWidget {
  AdminSaranDoa({super.key});

  final CollectionReference _doa =
      FirebaseFirestore.instance.collection('doas');
  @override
  Widget build(BuildContext context) {
    // List<DoaModel> doaData = doaDatas.map((e) => DoaModel.fromJson(e)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Saran Doa-Doa',
          style: CustomTextStyle.textStyleBlue(16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TambahDoa(),
                ));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              //Kumpulan doa untuk jiwa yang lebih dekat dengan Allah
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                child: Text(
                    'Kumpulan doa untuk jiwa yang lebih dekat dengan Allah',
                    style: CustomTextStyle.textStyleBlack(12)),
              ),
              //row
              StreamBuilder<QuerySnapshot>(
                stream: DatabaseService().getDoas(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      List doaList = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: doaList.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot = doaList[index];
                          Map<String, dynamic> data =
                              documentSnapshot.data() as Map<String, dynamic>;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    //foto

                                    const SizedBox(width: 8),
                                    //text
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            data['title'] ?? 'data kosong',
                                            style:
                                                CustomTextStyle.textStyleBlue(
                                                    12),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                              data['waktu'] ?? 'data kosong',
                                              style: CustomTextStyle
                                                  .textStyleBlack(10)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                //tombol edit
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => EditDoa(
                                        doaData: documentSnapshot,
                                      ),
                                    ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const ShapeDecoration(
                                          color: Color(0x727EB2E7),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const ShapeDecoration(
                                          color: Color(0x7F5399DF),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const ShapeDecoration(
                                          color: Color(0x7F2066AC),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.edit,
                                        color: Colors.greenAccent,
                                      ),
                                    ],
                                  ),
                                ),

                                //tombol delete
                                GestureDetector(
                                  onTap: () {
                                    _doa.doc(documentSnapshot.id).delete();
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const ShapeDecoration(
                                          color: Color(0x727EB2E7),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const ShapeDecoration(
                                          color: Color(0x7F5399DF),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const ShapeDecoration(
                                          color: Color(0x7F2066AC),
                                          shape: OvalBorder(),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.delete,
                                        color: Colors.greenAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
