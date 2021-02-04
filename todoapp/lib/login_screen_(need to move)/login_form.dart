import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/login_screen_(need%20to%20move)/auth_provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController, _passwordController;

  void _login() async {
    FocusScope.of(context).unfocus();
    Auth _user = Provider.of<Auth>(context, listen: false);
    String output = await _user.loginUserWithEmail(
        email: _emailController.text, password: _passwordController.text);
    if (output == "ok") {
      _showSnackBar("Login Successful");
      //TODO: next page e jabar functionality add korte hobe.
    } else
      _showSnackBar("Login Failed");
  }

  _showSnackBar(String message) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          TextField(controller: _emailController),
          TextField(controller: _passwordController),
          RaisedButton(onPressed: _login, child: Text("Login")),
          RaisedButton(onPressed: _login, child: Text("Log out"))
        ],
      ),
    );
  }
}
