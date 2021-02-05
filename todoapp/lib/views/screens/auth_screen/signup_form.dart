import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/state_manager/auth_provider.dart';
import 'package:todoapp/utils/constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String _email, _password, _fullName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.name,
          decoration: inputDecoration.copyWith(labelText: "Fullname"),
          onChanged: (val) => _fullName = val.trim(),
        ),
        SizedBox(height: 8.0),
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
          onPressed: () => _signUp(
            email: _email,
            fullName: _fullName,
            password: _password,
          ),
          child: Text("Signup"),
        ),
      ],
    );
  }

  _showSnackBar(String message) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));

  void _signUp({
    String email,
    String password,
    String fullName,
  }) async {
    FocusScope.of(context).unfocus();
    Auth _user = Provider.of<Auth>(context, listen: false);
    String output = await _user.signUpUser(
        email: _email, password: _password, fullName: _fullName);
    if (output == "ok") {
      _showSnackBar("Signup Successful, Please Log in");
      //TODO: next page e jabar functionality add korte hobe.
    } else
      _showSnackBar("Signup Failed");
  }
}
