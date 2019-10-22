
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class SettingsScreen extends StatefulWidget {
  
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  List<String> savedNames = [
    "Suits fabrics",
    "Silk fabric",
    "Saved calculations with a long title that will displayed on appSaved calculations with a long title that will displayed on appSaved calculations with a long title that will displayed on app",
    "Suits fabrics",
    "Silk fabric",
    "Saved calculations with a long title that will displayed on app",
    "Suits fabrics",
    "Silk fabric",
    "Saved calculations with a long title that will displayed on app",
    "Suits fabrics",
    "Silk fabric",
    "Saved calculations with a long title that will displayed on app",
  ];

  List<Widget> settingsWidgets() {
    List<Widget> res = List<Widget>();

    res.add(
      Container(
        height: 56,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
            ),
          )
        ),
      )
    );

    res.add(
      Container(
        height: 56,
        child: FlatButton(
          onPressed: () {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                OMIcons.supervisedUserCircle,
                color: Color(0xFF4527A0),
              ),
              SizedBox(width: 18,),
              Text(
                "Example of the long user name",
                textAlign: TextAlign.left,
              ),
            ]
          ),
          color: Color(0xFFF6F4FA),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          
        ),
      ) 
    );

    res.add(
      Container(
        height: 56,
        child: FlatButton(
          onPressed: () {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                OMIcons.unsubscribe,
                color: Color(0xFF4527A0),
              ),
              SizedBox(width: 18,),
              Text(
                "Log out",
                textAlign: TextAlign.left,
              ),
            ]
          ),
          color: Color(0xFFF6F4FA),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          
        ),
      ) 
    );
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                (settingsWidgets()).map<Widget>((f) => 
                  Padding(
                    padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                    child: f,
                  )
                ).toList()
              ),
            )
          ],
        ),
      )
    );
  }
}