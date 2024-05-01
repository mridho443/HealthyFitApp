import 'package:flutter/material.dart';
import 'package:healthyfitapp/pages/doa.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class BeforeDoa extends StatelessWidget {
  final Map<String, dynamic> doaData;
  const BeforeDoa({super.key, required this.doaData});

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
        title: Text('Doa',
            textAlign: TextAlign.center,
            style: CustomTextStyle.textStyleBlue(17)),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/flower background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 220),
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dzikir & Doa',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 16,
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.send_rounded),
                              SizedBox(width: 11),
                              Stack(
                                children: [
                                  Icon(Icons.heart_broken),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(doaData['title'] ?? 'data kosong',
                            style: CustomTextStyle.textStyleBlue(24)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Apa Yang Akan Kamu Butuhkan ',
                                  style: TextStyle(
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 16,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.timer),
                              const SizedBox(width: 7),
                              SizedBox(
                                width: 160,
                                height: 15,
                                child: Text(
                                  doaData['waktu'],
                                  style: CustomTextStyle.textStyleBlue(12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.person_outline),
                              const SizedBox(width: 7),
                              SizedBox(
                                width: 295,
                                height: 15,
                                child: Text(
                                  'Tempat yang tenang dan minim distraksi agar lebih konsentrasi ',
                                  style: CustomTextStyle.textStyleBlue(12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Apa Yang Akan Kamu Dapatkan',
                                  style: TextStyle(
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 16,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle),
                              const SizedBox(width: 7),
                              SizedBox(
                                width: 140,
                                height: 15,
                                child: Text(
                                  'Doa sesuai suasana hatimu',
                                  style: CustomTextStyle.textStyleBlue(12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle),
                              const SizedBox(width: 7),
                              SizedBox(
                                width: 295,
                                height: 15,
                                child: Text(
                                  'Doa yang Insyaa Allah bisa membantumu merasa lebih baik',
                                  style: CustomTextStyle.textStyleBlue(12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Doa(
                              doaData: doaData,
                            ),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: const Color(0xFF2066AC),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          minimumSize: const Size(210, 34),
                        ),
                        child: const Text(
                          'Mulai Sesi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
