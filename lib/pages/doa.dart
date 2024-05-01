import 'package:flutter/material.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class Doa extends StatefulWidget {
  final Map<String, dynamic> doaData;
  const Doa({super.key, required this.doaData});

  @override
  State<Doa> createState() => _DoaState();
}

class _DoaState extends State<Doa> {
  Map<String, Color> mode = {
    "firstColor": Colors.black,
    "secondColor": Colors.white
  };
  int now = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: mode["firstColor"]),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Doa',
            textAlign: TextAlign.center,
            style: CustomTextStyle.textStyleBlue(17)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 240,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Group 16.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 220),
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: mode["secondColor"],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 22,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.doaData['title'],
                              style: CustomTextStyle.textStyleBlue(24)),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 327,
                          child: Text(widget.doaData['doa'],
                              style: TextStyle(
                                color: mode["firstColor"],
                                fontSize: 16,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (now == 0) {
            setState(() {
              mode = {"firstColor": Colors.white, "secondColor": Colors.black};
              now = 1;
            });
          } else {
            setState(() {
              mode = {"firstColor": Colors.black, "secondColor": Colors.white};
              now = 0;
            });
          }
        },
        tooltip: 'Increment',
        child: Text(
          "Dark Mode",
          textAlign: TextAlign.center,
          style: CustomTextStyle.textStyleBlue(13),
        ),
      ),
    );
  }
}
