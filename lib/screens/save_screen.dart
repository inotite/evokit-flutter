
import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save"),
      ),
      body: Center(
        child: Text(
          "Save screen",
          style: TextStyle(fontSize: 24)
        ),
      ),
    );
  }
}