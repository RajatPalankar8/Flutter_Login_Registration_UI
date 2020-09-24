

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/LoginPage.dart';
import 'package:flutter_login_ui/RegistrationPage.dart';
import 'package:flutter_login_ui/SocialSignWidgetRow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
class WelcomePage extends StatelessWidget {
  bool back = false;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: WillPopScope(
        onWillPop: () async {
          // You can do some work here.
          // Returning true allows the pop to happen, returning false prevents it.
          print(i);

          if(i==0)
            {

              i++;
              _showSnackbar();
            }
          else{
            back = true;
          }
          return back;
        },
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/assets/backgroundUI.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,40 , 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                        width: 100,
                        child: SvgPicture.asset("images/assets/xing.svg")),
                    HeightBox(10),
                    "Welcome, Nice to see you again".text.color(Colors.white).size(20).make(),
                    HeightBox(20),
                    GestureDetector(
                      onTap: (){
                        print("Login Clicked");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                        child: "Login".text.white.light.xl.makeCentered().box.white.shadowOutline(outlineColor: Colors.grey).color(Color(0XFFFF0772)).roundedLg.make().w(150).h(40)),
                    HeightBox(20),
                    "Login with".text.white.makeCentered(),
                    HeightBox(20),

                   SocialSignWidgetRow()

                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
        },
        child: RichText(text: TextSpan(
          text: 'New User?',
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: ' Register Now',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0XFF4321F5)),
            ),
          ],
        )
        ).pLTRB(20, 0, 0, 15),
      )
    );
  }
}
void _showSnackbar() {
  final snack = SnackBar(
    content: Text("Press Back to Exit the app"),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.green,
  );
  _globalKey.currentState.showSnackBar(snack);
}





