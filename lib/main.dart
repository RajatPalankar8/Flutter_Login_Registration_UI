import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Screen/Dashboard.dart';
import 'package:flutter_login_ui/Screen/LoginPage.dart';
import 'package:flutter_login_ui/Screen/RegistrationPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_ui/WelcomePage.dart';
import 'package:flutter_login_ui/isSignedIn.dart';
import 'package:get/get.dart';

import 'InstanceBinding.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: IsSignedIn(),
      routes: {
        '/welcome':(context) => WelcomePage(),
        '/login':(context)=> LoginPage(),
        '/reg':(context)=>RegistrationPage(),
        '/dashboard':(context)=>Dashboard(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),


    );
  }
}

