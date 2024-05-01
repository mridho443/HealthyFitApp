import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthyfitapp/pages/admin_saran_doa.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class TambahDoa extends StatefulWidget {
  TambahDoa({super.key});

  @override
  State<TambahDoa> createState() => _TambahDoaState();
}

class _TambahDoaState extends State<TambahDoa> {
  final CollectionReference _doas =
      FirebaseFirestore.instance.collection('doas');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _waktuController = TextEditingController();
  final TextEditingController _doaController = TextEditingController();

  String error = '';

  bool loading = false;

  //text field state
  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
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
              Text('Form Tambah Doa',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.textStyleBlue(20)),
              Container(
                height: 24,
              ),
              TextFormField(
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
              TextFormField(
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
              TextFormField(
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
                  shadows: [
                    const BoxShadow(
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => AdminSaranDoa()),
                      ),
                    );
                    _doas.add({'title': title, 'waktu': waktu, 'doa': doa});
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
