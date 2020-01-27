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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String error = '';
    final AuthService _auth = AuthService();
    return loading
        ? Loading()
        : Scaffold(
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
                                "SignIn",
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
                                val.isEmpty ? 'Enter an Email' : null,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Enter your Password"),
                            onChanged: (txt) {
                              password = txt;
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 125.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.black54,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
                            child: Text(
                              "SignUp",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () {
                              widget.toggleView();
                            },
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 125.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.black54,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              "SignIn",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ])
                ]),
          ));
  }
}
//Row ( mainAxisAlignment : MainAxisAlignment.spaceBetween, children: <Widget>[
//RaisedButton(
//child: Text("SignUp"),
//onPressed: (){
//widget.toggleView();
//},
//),

//RaisedButton(
//child: Text("SignIn"),
//onPressed: () async {
//if (_formKey.currentState.validate()){
//setState(() =>  loading = true);
//dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//if (result == null) {
//setState(() {
//loading = false;
//error = "Enter Valid Email";
//});
//}
//}
//
//},
//),
//],),
