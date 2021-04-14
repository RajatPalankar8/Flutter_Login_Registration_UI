import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ProviderExample/ProviderHelper/ProviderState.dart';
import 'package:flutter_login_ui/ProviderExample/Screens/ProviderLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_ui/WelcomePage.dart';
import 'package:flutter_login_ui/isSignedIn.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'GetXExample/Screen/Dashboard.dart';
import 'GetXExample/Screen/LoginPage.dart';
import 'GetXExample/Screen/RegistrationPage.dart';
import 'InstanceBinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>ProviderState())],
       child: MyProviderApp(),
     )


  );
}

class MyProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProviderLogin(),
    );
  }
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ProviderLogin(),
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/reg': (context) => RegistrationPage(),
        '/dashboard': (context) => Dashboard(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
