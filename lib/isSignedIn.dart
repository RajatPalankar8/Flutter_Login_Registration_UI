import 'GetXHelper/FirebaseController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'Screen/LoginPage.dart';
import 'Screen/Dashboard.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
       return Get.find<FirebaseController>().user!=null ? Dashboard() : LoginPage();
    });
  }
}
