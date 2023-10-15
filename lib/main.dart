import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharespace/Registration/loginScreen.dart';
import 'Registration/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: 'Share Space',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      getPages: [
        GetPage(
          name: '/SplashScreen',
          page: () => const SplashScreen(),
        ),
      ],
    ),
  );
}
