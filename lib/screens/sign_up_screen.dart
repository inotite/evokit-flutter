
import 'package:evokit/models/user.dart';
import 'package:evokit/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

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

  Widget signUpWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
                controller: name,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(),
                ),
                controller: email,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                controller: password,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
                controller: passwordConfirmation,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 40,
                child: FlatButton(
                  onPressed: () async {
                    final response = await registerUser(name.text, email.text, password.text, passwordConfirmation.text);

                    if (response["success"] == false) return;

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TabScreen())
                    );
                  },
                  child: Text(
                    "Create Account".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Color(0xFF4636A6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                ),
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 40,
                child: FlatButton(
                  onPressed: () {

                  },
                  child: Text(
                    "Sign In".toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF4636A6),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
            ]
            .map((c) => Container(
              padding: EdgeInsets.only(bottom: 10),
              child: c,
            ))
            .toList(),
          ),
        ),
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
              signUpWidget(),
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
