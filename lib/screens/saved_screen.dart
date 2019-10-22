
import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

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

  List<Widget> getSavedItems() {
    List<Widget> res = List<Widget>();
    res.add(
      Container(
        height: 56,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Saved calculations",
            style: TextStyle(
              fontSize: 24,
            ),
          )
        ),
      )
    );

    savedNames.forEach((itm) {
      res.add(
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itm,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Roboto"
                  ),
                ),
              ]
            )
          ),
          height: 48.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Color(0xFFF6F4FA),
          ),
        )
      );
    });
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
                (getSavedItems()).map<Widget>((f) => 
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