import 'package:flutter/material.dart';
import 'package:freedu_frontend/presentation/pages/login/login_page.dart';
import 'package:freedu_frontend/presentation/pages/registration/registration_page.dart';
import 'package:freedu_frontend/utils/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freedu',
      theme: Style.main,
      home: const RegistrationPage(),
    );
  }
}
