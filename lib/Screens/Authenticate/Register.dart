import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wizzards/Services/Auth.dart';
import 'package:wizzards/Shared/Loading.dart';
class Register extends StatefulWidget {
  final Function toggleView;
Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = '';
  String email = '';
  String food = '';
  String password = '';
  String _picked = "NonVeg";
  bool loading = false;
  bool veg = false;
  bool nonVeg = false;
  int _radioValue = -1;
  void _foodRadioHandler(int value){
    setState(() {
      _radioValue = value;
      switch(_radioValue){
        case 0 :
          food = "Veg";
          break;
        case 1:
          food = "NonVeg";
          break;
      }
    });


  }

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();
    return loading? Loading() :
    Scaffold(
        body : Column(
            mainAxisAlignment : MainAxisAlignment.spaceEvenly ,children : <Widget> [ Form(
          key: _formKey,
          child: Container (
            padding: EdgeInsets.only(left: 40, right: 40, top: 40),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container (padding: EdgeInsets.only(left: 30, right: 30), child : Text("SignUp", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),)),

                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(labelText: "Enter your Name"),
                  onChanged: (txt) {
                    name = txt;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  decoration: InputDecoration(labelText: "Enter your Email"),
                  onChanged: (txt) {
                    email = txt;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val.length < 6 ? 'Password should be 6+ characters' : null,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Enter your Password"),
                  onChanged: (txt) {
                    password = txt;
                  },
                ),
                SizedBox(height: 20,),
//                TextFormField(
//                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
//                  decoration: InputDecoration(labelText: "Veg/NonVeg"),
//                  onChanged: (txt) {
//                    food = txt;
//                  },
//                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Vegeterian", style: TextStyle(fontWeight: FontWeight.w400),),
                        Radio(
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: _foodRadioHandler,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Non- Vegeterian", style: TextStyle(fontWeight: FontWeight.w400),),
                        Radio(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: _foodRadioHandler,
                        ),
                      ],
                    )
                  ],
                ),
              ],),),),
                Row (
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment : MainAxisAlignment.spaceEvenly, children: <Widget>[

                  ButtonTheme(
                    minWidth: 125.0,
                    height: 50.0,
                    child:RaisedButton(

                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      ),
                      child: Text("SignIn"),
                      onPressed: (){
                        widget.toggleView();
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 125.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Text("SignUp"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()){
                          setState(() =>  loading = true);
                          dynamic result = await _auth.registerWithEmailAndPassword(
                              name, email, password, _picked);
                          if (result == null) {
                            setState(() {
                              loading = false;
                            });
                          }

                        }

                      },
                    ),
                  ),

                ])]));
  }
}

