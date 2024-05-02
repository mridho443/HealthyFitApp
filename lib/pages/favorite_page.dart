import 'dart:math';
import 'package:flutter/material.dart';
import 'package:healthyfitapp/pages/before_doa.dart';
import 'package:healthyfitapp/services/favdb.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool _isLoading = true;
  late List<Map<String, dynamic>> _doaList;
  List<String> fotos = [
    "images/foto3.png",
    "images/foto2.png",
    "images/foto1.png"
  ];
  @override
  void initState() {
    super.initState();
    _refreshDoaList();
  }

  Future<void> _refreshDoaList() async {
    setState(() {
      _isLoading = true;
    });

    List<Map<String, dynamic>> data = await SQLHelper.getItems();
    setState(() {
      _doaList = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Doa',
          style: CustomTextStyle.textStyleBlue(16),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 20, top: 10),
                child: Text(
                  'Kumpulan doa untuk jiwa yang lebih dekat dengan Allah',
                  style: CustomTextStyle.textStyleBlack(12),
                ),
              ),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _buildDoaList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoaList() {
    int randomIndex = Random().nextInt(fotos.length);
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: _doaList.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> data = _doaList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BeforeDoa(
                      doaData: data,
                    ),
                  ));
                },
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BeforeDoa(
                            doaData: data,
                          ),
                        ));
                      },
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFF8EE984),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Container(
                                width: 38,
                                height: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(fotos[randomIndex]),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  data['title'] ?? 'data kosong',
                                  style: CustomTextStyle.textStyleBlue(12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 4),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  data['waktu'] ?? 'data kosong',
                                  style: CustomTextStyle.textStyleBlack(10),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteItem(data);
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
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

  Future<void> _deleteItem(Map<String, dynamic> data) async {
    await SQLHelper.deleteItem(data['id']);
    _refreshDoaList();
  }
}
