import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthyfitapp/shared/text_style.dart';

// ignore: must_be_immutable
class EditDoa extends StatelessWidget {
  var doaData;
  EditDoa({super.key, required this.doaData});

  final CollectionReference _doas =
      FirebaseFirestore.instance.collection('doas');

  TextEditingController _titleController = TextEditingController();
  TextEditingController _waktuController = TextEditingController();
  TextEditingController _doaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = doaData['title'];
    _waktuController.text = doaData['waktu'];
    _doaController.text = doaData['doa'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xFFF2F2F2),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Form Edit Doa',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.textStyleBlue(20)),
              Container(
                height: 24,
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Title Doa',
                  hintStyle: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 24,
              ),
              TextField(
                controller: _waktuController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Waktu Doa',
                  hintStyle: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 24,
              ),
              TextField(
                controller: _doaController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Doa',
                  hintStyle: const TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 14,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 24,
              ),
              Container(
                width: double.infinity,
                height: 55,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF2066AC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    final String title = _titleController.text;
                    final String waktu = _waktuController.text;
                    final String doa = _doaController.text;

                    print(doaData);
                    await _doas
                        .doc(doaData?.id)
                        .update({'title': title, 'waktu': waktu, 'doa': doa});
                    Navigator.of(context).pop();  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2066AC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Tambahkan Doa',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
