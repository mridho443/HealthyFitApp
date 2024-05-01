import 'package:flutter/material.dart';
import 'package:healthyfitapp/model/myuser_model.dart';
import 'package:healthyfitapp/pages/authentication/authenticate.dart';
import 'package:healthyfitapp/pages/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel?>(context);
    print(user?.email);

    // return either the Home or Authenticate widget
    if (user?.uid == 'null') {
      print("111111111111111111111111111111111111111");
      return Authenticate();
    } else {
      print("22222222222222222222222222222222222222");
      return Home();
    }
  }
}
