
import 'package:evokit/models/user.dart';
import 'package:evokit/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:evokit/screens/sign_up_screen.dart';

class ForgotPwdScreen extends StatefulWidget {

  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {

  TextEditingController email = TextEditingController();

  Widget logoWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: 10, right: 10
            ),
            child: Text(
              "E",
              style: TextStyle(
                color: Colors.black,
                fontSize: 33.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: Colors.black
            )
          ),
        ),
        SizedBox(width: 8,),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: 13.0, left: 20.0, bottom: 13.0, right: 20.0
            ),
            child: Text(
              "Kit".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
              ),
            )
          ),
          decoration: BoxDecoration(
            color: Color(0xFF4636A6)
          ),
        ),
      ],
    );
  }

  Widget forgotPwdWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(),
                ),
                controller: email,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 40,
                child: FlatButton(
                  onPressed: () async {
                    final response = await resetPassword(email.text);

                    if (response["success"] == false) return;

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthScreen()));
                  },
                  child: Text(
                    "Send Password Reset Link".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Color(0xFF4636A6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                ),
              ),
            ]
            .map((c) => Container(
              padding: EdgeInsets.only(bottom: 10),
              child: c,
            ))
            .toList(),
          ),
        ),
        ButtonTheme(
          minWidth: double.infinity,
          height: 50,
          child: FlatButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SignUpScreen();
                  }
                )
              );
            },
            child: Text(
              "Sign In".toUpperCase(),
              style: TextStyle(
                color: Color(0xFF4636A6),
                fontWeight: FontWeight.bold
              ),
            ),
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logoWidget(),
              forgotPwdWidget(),
            ]
            .map((c) => Container(
              padding: EdgeInsets.only(bottom: 15),
              child: c
            ))
            .toList(),
          ),
        )
      ),
      backgroundColor: Colors.white,
    );
  }
}
