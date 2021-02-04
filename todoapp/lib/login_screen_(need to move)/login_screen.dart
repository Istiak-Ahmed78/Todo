import 'package:flutter/material.dart';
import 'package:todoapp/login_screen_(need%20to%20move)/login_form.dart';

class LoginScreen extends StatelessWidget {
  final String imgUrl =
      "https://p.kindpng.com/picc/s/393-3933176_flutter-app-development-flutter-developer-hd-png-download.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image.network(imgUrl, scale: 1.6),
          LoginForm(),
          Spacer(),
        ],
      ),
    );
  }
}

//TODO: need to reshape the icon. square na may be. 512x512px will be fruitful.
//TODO: need to know user theke ki ki info nite hobe.
