import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff146678);
Color lightPrimaryColor = const Color(0xff146678).withOpacity(0.5);
Color greyColor = const Color(0xff8A8A8A);
Color lightGreyColor = const Color(0xff8A8A8A).withOpacity(0.7);
Color errorColor = const Color(0xffFF6F6F);

class Style {

  static final main = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
      primaryColorLight: lightPrimaryColor,
      secondaryHeaderColor: lightGreyColor,
      errorColor: errorColor,
      brightness: Brightness.light
  );

  static const loginBackgroundImage = DecorationImage(
    image: AssetImage("assets/images/background_login.jpg"),
    fit: BoxFit.cover,
  );

  static const mainBackgroundImage = DecorationImage(
    image: AssetImage("assets/images/background_main.jpg"),
    fit: BoxFit.cover,
  );
}