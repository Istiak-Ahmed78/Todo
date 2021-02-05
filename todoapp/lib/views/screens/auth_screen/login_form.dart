import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/user.dart';
import 'package:todoapp/state_manager/auth_provider.dart';
import 'package:todoapp/utils/constants.dart';

import '../navigator_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: inputDecoration.copyWith(labelText: "Email"),
          onChanged: (val) => _email = val.trim(),
        ),
        SizedBox(height: 8.0),
        TextField(
          decoration: inputDecoration.copyWith(labelText: "Password"),
          obscureText: true,
          onChanged: (val) => _password = val,
        ),
        SizedBox(height: 8.0),
        RaisedButton(
          onPressed: () => _login(_email, _password),
          child: Text("Login"),
        ),
      ],
    );
  }

  void _login(String email, String password) async {
    FocusScope.of(context).unfocus();
    Auth _user = Provider.of<Auth>(context, listen: false);
    String output =
        await _user.loginUserWithEmail(email: _email, password: _password);
    print("ok");
    if (output == "ok") {
      _showSnackBar("Login Successful. Please Log in now.");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StreamProvider<UserModel>.value(
          initialData: UserModel(fullName: ""),
          value: _user.currentUser,
          child: NavigatorScreen(),
        ),
      ));
      //TODO: next page e jabar functionality add korte hobe.
    } else
      _showSnackBar("Login Failed");
  }

  _showSnackBar(String message) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
}
