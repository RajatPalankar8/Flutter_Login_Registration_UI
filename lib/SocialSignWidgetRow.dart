import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialSignWidgetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Container(
          width: 30,
          height: 30,
          child: SvgPicture.asset("images/assets/google.svg"),
        ),
        Container(
          width: 30,
          height: 30,
          child: SvgPicture.asset("images/assets/facebook.svg"),
        ),
      ],
    );
  }
}
