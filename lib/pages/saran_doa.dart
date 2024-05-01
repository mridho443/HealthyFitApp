import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthyfitapp/pages/before_doa.dart';
import 'package:healthyfitapp/services/database.dart';
import 'package:healthyfitapp/services/favdb.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class SaranDoa extends StatelessWidget {
  SaranDoa({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fotos = [
      "images/foto3.png",
      "images/foto2.png",
      "images/foto1.png"
    ];
    int randomIndex = Random().nextInt(fotos.length);

    // List<DoaModel> doaData = doaDatas.map((e) => DoaModel.fromJson(e)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saran Doa-Doa',
          style: CustomTextStyle.textStyleBlue(16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                      print(doaList[0]);
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => BeforeDoa(
                                        doaData: data,
                                      ),
                                    ));
                                  },
                                  child: Row(
                                    children: [
                                      //foto
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFF8EE984),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 38,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    fotos[randomIndex]),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      //text
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 180,
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
                                      //tombol play
                                      Stack(
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
                                          Container(
                                            width: 32,
                                            height: 29,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "images/Play.png"),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Ketika tombol ditekan, tambahkan item ke favorit
                                    // Gantilah parameter dengan data yang sesuai dari dokumen
                                    SQLHelper.createItem(data['title'],
                                        data['doa'], data['waktu']);
                                  },
                                  icon: Icon(Icons
                                      .favorite_border), // Icon favorit kosong
                                  color: Colors
                                      .red, // Atur warna sesuai keinginan Anda
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/FavoritePage');
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.favorite), // Atur warna sesuai keinginan Anda
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
