import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Authenticate/ForgetPassword.dart';
import 'package:wizzards/Services/Auth.dart';
import 'package:wizzards/Shared/Loading.dart';

class Signin extends StatefulWidget {
  final Function toggleView;
  Signin({this.toggleView});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();
    return loading
        ? Loading()
        : Container(
            color: Colors.black12,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 60),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                "Sign In",
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
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter an Password' : null,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Enter your Password"),
                            onChanged: (txt) {
                              password = txt;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 16),
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
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result is String) {
                                    setState(() {
                                      error = (result.split('.')[0] ) + '.';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(children: <Widget>[
                    InkWell(
                      child: Text("Forget Password?"),
                      onTap: () {
                                          Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              ForgetPassword()));
                      },
                    ),
                    Text(
                      "Dont have an account ? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ButtonTheme(
                      minWidth: 125.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        onPressed: () {
                          widget.toggleView();
                        },
                      ),
                    ),
                  ])
                ]),
          );
  }
}
