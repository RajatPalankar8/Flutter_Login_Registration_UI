import 'package:flutter/material.dart';
import 'package:flutter_login_ui/GetXExample/GetXHelper/FirebaseController.dart';


import 'package:get/get.dart';

import 'DeleteAccount.dart';

class Dashboard extends GetWidget<FirebaseController> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(controller.imageurl),
            RaisedButton(onPressed: (){
             //logout
              controller.signout();
            },child: Text("Sign Out ${controller.user}"),),
            RaisedButton(onPressed: (){
              //logout
              Get.to(DeleteAccount());
            },child: Text("Delete Account"),),
            RaisedButton(onPressed: (){
              //logout
              controller.google_signOut();
            },child: Text("Sign out Google Sign in"),),
          ],
        ),
      ),
    );
  }
}
