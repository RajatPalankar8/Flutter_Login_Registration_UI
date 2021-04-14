
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'GetXExample/GetXHelper/FirebaseController.dart';
import 'GetXExample/Screen/Dashboard.dart';
import 'GetXExample/Screen/LoginPage.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
       return Get.find<FirebaseController>().user!=null ? Dashboard() : LoginPage();
    });
  }
}
