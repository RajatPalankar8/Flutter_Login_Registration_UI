import 'package:flutter/material.dart';
import 'package:flutter_login_ui/GetXHelper/FirebaseController.dart';
import 'package:flutter_login_ui/Screen/DeleteAccount.dart';

import 'package:get/get.dart';

class Dashboard extends GetWidget<FirebaseController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(onPressed: (){
             //logout
              controller.signout();
            },child: Text("Sign Out"),),
            RaisedButton(onPressed: (){
              //logout
              Get.to(DeleteAccount());
            },child: Text("Delete Account"),),
          ],
        ),
      ),
    );
  }
}
