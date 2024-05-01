import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthyfitapp/model/myuser_model.dart';
import 'package:healthyfitapp/pages/admin_feeling.dart';
import 'package:healthyfitapp/pages/admin_saran_doa.dart';
import 'package:healthyfitapp/pages/authentication/splash_screen.dart';
import 'package:healthyfitapp/pages/favorite_page.dart';
import 'package:healthyfitapp/pages/feeling.dart';
import 'package:healthyfitapp/pages/saran_doa.dart';
import 'package:healthyfitapp/pages/textfield_feeling.dart';
import 'package:healthyfitapp/services/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:healthyfitapp/firebase_options.dart';
import 'package:healthyfitapp/pages/home.dart';
import 'package:healthyfitapp/pages/wrapper.dart';
import 'package:healthyfitapp/services/auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.isDarkTheme
            ? ThemeData.dark()
            : ThemeData.light(), // Dark and Light theme based on provider
        darkTheme: ThemeData
            .dark(), // Define dark theme settings here if different from default
        initialRoute: "/SplashScreen",
        routes: {
          '/SplashScreen': (context) => AnimatedSplashScreen(
                splash: const SplashScreen(),
                duration: 5000,
                splashTransition: SplashTransition.scaleTransition,
                centered: true,
                nextScreen: const Wrapper(),
                splashIconSize: double.infinity,
                animationDuration: const Duration(milliseconds: 2000),
              ),
          '/Login': (context) => const Wrapper(),
          '/Home': (context) => Home(),
          '/SaranDoa': (context) => SaranDoa(),
          '/Feeling': (context) => const Feeling(),
          '/TextFieldFeeling': (context) => TextFieldFeeling(),
          '/AdminSaranDoa': (context) => AdminSaranDoa(),
          '/AdminFeeling': (context) => AdminFeeling(),
          '/FavoritePage': (context) => FavoritePage(),
        },
      ),
    );
  }
}
