import 'package:flutter/material.dart';
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
  final _formResetKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();
    return loading
        ? Loading()
        : Scaffold(
          key: _key,
          resizeToAvoidBottomPadding: false,
          body: Container(
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
                              showDialog(context: context,
                              builder : (BuildContext context){
                                String emailReset = '';
                              return Dialog(elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  width: 400,
                                  margin: EdgeInsets.only(left : 10, right: 10),
                                  child: Form(
                        key: _formResetKey,
                        child: Column(

                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top:20)),
                            Text("Reset Password", style: TextStyle(fontSize : 24, fontWeight : FontWeight.w600),),
                            
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(decoration: InputDecoration(hintText: 'example@gmail.com', labelText:'Email'),
                                  onChanged: (txt){
                                    emailReset = txt;
                                  },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ButtonTheme(
                              minWidth: 125.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Reset",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                onPressed: () async {
                                    
                                    if (_formResetKey.currentState.validate()) {
                                      await _auth.resetPassword(emailReset);
                                      Navigator.pop(context);
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      _key.currentState.showSnackBar(SnackBar(content: Text("Email has been sent!")));


                                    }
                                  },
                              ),
                            ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom:20)),
                          ],
                        ),
                      ),
                                ),
                              );
                              }
                              );
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
            ),
        );
  }
}
