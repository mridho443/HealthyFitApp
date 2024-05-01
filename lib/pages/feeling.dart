import 'package:flutter/material.dart';
import 'package:healthyfitapp/datajson/feeling_data.dart';
import 'package:healthyfitapp/model/feeling_model.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class Feeling extends StatelessWidget {
  const Feeling({super.key});

  @override
  Widget build(BuildContext context) {
    String feeling = ModalRoute.of(context)!.settings.arguments.toString();
    List<FeelingModel> feelingData =
        feelingDatas.map((e) => FeelingModel.fromJson(e)).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Layanan Konseling',
            textAlign: TextAlign.center,
            style: CustomTextStyle.textStyleBlue(17)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF2F2F2),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17,
                    ),
                    const SizedBox(width: 5),
                    Text('Kategori Permasalahan',
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.textStyleBlue(10)),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kenapa Merasa Hari Anda $feeling ?",
                      style: CustomTextStyle.textStyleBlue(18),
                    )),
                const SizedBox(
                  height: 24,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 item per baris
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: feelingData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        List x = [feeling, feelingData[index].kategori!];
                        // print(x);
                        Navigator.of(context)
                            .pushNamed("/TextFieldFeeling", arguments: x);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF1D5C9B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 36,
                                    height: 37.93,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/aa 1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(feelingData[index].kategori!,
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.textStyleBlack(14)),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
