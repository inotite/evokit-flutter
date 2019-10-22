
import 'dart:async';

import 'package:evokit/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12, right: 12
                ),
                child: Text(
                  "E",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 59.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 7,
                  color: Colors.black
                )
              ),
            ),
            SizedBox(width: 12,),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 18.0, left: 20.0, bottom: 18.0, right: 20.0
                ),
                child: Text(
                  "Kit".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none
                  ),
                )
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xFF4636A6)
                ),
                color: Color(0xFF4636A6)
              ),
            ),
          ],
        )
      ),
    );
  }
}