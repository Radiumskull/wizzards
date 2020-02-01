import 'package:flutter/material.dart';
import 'package:wizzards/Services/Auth.dart';


class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final AuthService _auth = AuthService();
  String email = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 60),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Text(
                              "Forget Reset",
                              style: TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.w800),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          decoration:
                              InputDecoration(labelText: "Enter your Email"),
                          onChanged: (txt) {
                            email = txt;
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonTheme(
                          minWidth: 125.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _auth.resetPassword(email);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
  }
}