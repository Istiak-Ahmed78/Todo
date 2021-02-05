import 'package:flutter/material.dart';
import 'package:todoapp/screens/auth_screen/login_form.dart';
import 'package:todoapp/screens/auth_screen/signup_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AuthScreen> {
  String imgUrl =
      "https://p.kindpng.com/picc/s/393-3933176_flutter-app-development-flutter-developer-hd-png-download.png";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.network(imgUrl, scale: 1.6),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.grey,
                      tabs: [
                        Tab(child: Text("Login")),
                        Tab(child: Text("Signup")),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          LoginForm(),
                          SignUpForm(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: need to reshape the icon. square na may be. 512x512px will be fruitful.
//TODO: need to know user theke ki ki info nite hobe.
