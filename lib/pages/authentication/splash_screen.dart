import 'package:flutter/material.dart';
import 'package:healthyfitapp/shared/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Container(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Healthy Fit', style: CustomTextStyle.textStyleBlue(40)),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('images/wellness.png'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Assalamu'alaikum",
                  style: CustomTextStyle.textStyleBlue(24),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Tingkatkan ketentraman jiwa melalui solusi kesehatan mental yang terintegrasi',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.textStyleBlue(20),
                ),
                const SizedBox(
                  height: 50,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                //       builder: (context) => Wrapper(),
                //     ));
                //   },
                //   style: CustomElevatedButtonStyle.elevatedButtonBlue(),
                //   child: Container(
                //     height: 55,
                //     alignment: Alignment.center,
                //     child: Text(
                //       'Mulai Sekarang',
                //       style: CustomTextStyle.textStyleWhite(16),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
