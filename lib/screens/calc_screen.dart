
import 'package:flutter/material.dart';
import 'package:evokit/screens/save_screen.dart';

class CalcScreen extends StatefulWidget {
  
  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  String lengthUnit = "m";
  String weightUnit = "Kg";
  Map<String, double> unitRatio = Map<String, double>();
  TextEditingController totalCost = TextEditingController();
  TextEditingController lengthPrice = TextEditingController();
  TextEditingController weightPrice = TextEditingController();
  TextEditingController unitLengthWeight = TextEditingController();
  TextEditingController totalLength = TextEditingController();
  TextEditingController sleeveLength = TextEditingController();
  TextEditingController bodyLength = TextEditingController();
  TextEditingController name = TextEditingController();

  _CalcScreenState() {
    unitRatio["m"] = 1;
    unitRatio["cm"] = 0.01;
    unitRatio["dm"] = 0.1;
    unitRatio["mm"] = 0.001;
    unitRatio["inch"] = 0.0254;
    unitRatio["foot"] = 0.3048;
    unitRatio["yard"] = 0.9144;

    unitRatio["Kg"] = 1;
    unitRatio["Ton"] = 0.001;
    unitRatio["Gram"] = 1000;
    unitRatio["Pound"] = 2.2046;

    unitLengthWeight.text = "1.0";

    print(unitRatio);
  }

  double calculateRate() {
    return unitRatio[weightUnit] * unitRatio[lengthUnit];
  }

  void calculateTotalLength() {
    double sll = 0;
    if (sleeveLength.text.isNotEmpty)
      sll = double.parse(sleeveLength.text);
    if (bodyLength.text.isNotEmpty)
      sll += double.parse(bodyLength.text);
    totalLength.text = sll.toStringAsFixed(4);
  }

  void calculateTotalCost() {
    double lp = 0;
    if (lengthPrice.text.isNotEmpty)
      lp = double.parse(lengthPrice.text);
    double tl = 0;
    if (totalLength.text.isNotEmpty)
      tl = double.parse(totalLength.text);
    totalCost.text = (lp * tl).toStringAsFixed(4);

    print((lp * tl).toStringAsFixed(4));
  }

  double getWeightPerUnitLength() {
    double ulw = 1.0;
    if (unitLengthWeight.text.isNotEmpty)
      ulw = double.parse(unitLengthWeight.text);
    if (ulw <= 0)
      ulw = 1.0;
    return ulw;
  }

  void calculateLengthPrice() {
    double wp = 0;
    if (weightPrice.text.isNotEmpty)
      wp = double.parse(weightPrice.text);
    double ulw = getWeightPerUnitLength();
    lengthPrice.text = (wp * ulw).toStringAsFixed(4);
  }

  void calculateWeightPrice() {
    double lp = 0;
    if (lengthPrice.text.isNotEmpty)
      lp = double.parse(lengthPrice.text);
    double ulw = getWeightPerUnitLength();
    weightPrice.text = (lp / ulw).toStringAsFixed(4);
  }

  void calculateLengthUnit(ratio) {
    double length = 0;
    if (sleeveLength.text.isNotEmpty)
      length = double.parse(sleeveLength.text);
    sleeveLength.text = (length * ratio).toStringAsFixed(4);
    length = 0;
    if (bodyLength.text.isNotEmpty)
      length = double.parse(bodyLength.text);
    bodyLength.text = (length * ratio).toStringAsFixed(4);
    double lp = 0;
    if (lengthPrice.text.isNotEmpty)
      lp = double.parse(lengthPrice.text);
    lengthPrice.text = (lp / ratio).toStringAsFixed(4);
    double ulw = 1.0;
    if (unitLengthWeight.text.isNotEmpty)
      ulw = double.parse(unitLengthWeight.text);
    unitLengthWeight.text = (ulw / ratio).toStringAsFixed(4);

    calculateTotalLength();
    calculateWeightPrice();
    calculateTotalCost();
  }

  void calculateWeightUnit(ratio) {
    double wp = 0;
    if (weightPrice.text.isNotEmpty)
      wp = double.parse(weightPrice.text);
    weightPrice.text = (wp * ratio).toStringAsFixed(4);
    double ulw = 1.0;
    if (unitLengthWeight.text.isNotEmpty)
      ulw = double.parse(unitLengthWeight.text);
    unitLengthWeight.text = (ulw / ratio).toStringAsFixed(4);

    calculateLengthPrice();
    calculateTotalCost();
  }

  List<Widget> settingsRow() {
    return [
      Text("Settings"),
      Row(
        children: <Widget>[
          Text("Length Unit:"),
          DropdownButton<String>(
            value: lengthUnit,
            onChanged: (String newLength) {
              double ratio = double.parse((unitRatio[lengthUnit] / unitRatio[newLength]).toStringAsFixed(4));
              setState(() {
                lengthUnit = newLength;
              });
              calculateLengthUnit(ratio);
            },
            items: <String>["dm", "m", "cm", "mm", "inch", "foot", "yard"]
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          )
        ],
      ),
      Row(
        children: <Widget>[
          Text("Weight Unit:"),
          DropdownButton<String>(
            value: weightUnit,
            onChanged: (String newWeight) {
              double ratio = double.parse((unitRatio[weightUnit] / unitRatio[newWeight]).toStringAsFixed(8));
              setState(() {
                weightUnit = newWeight;
              });
              calculateWeightUnit(ratio);
            },
            items: <String>["Kg", "Ton", "Gram", "Pound"]
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          )
        ],
      )
    ];
  }

  List<Widget> fabricUsageRow() {
    return [
      Container(
        height: 56,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Calculator",
            style: TextStyle(
              fontSize: 24,
            ),
          )
        ),
      ),
      Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Sleeve",
                border: OutlineInputBorder(),
                suffixText: "$lengthUnit"
              ),
              keyboardType: TextInputType.number,
              onChanged: (newLength) {
                calculateTotalLength();
                calculateTotalCost();
              },
              controller: sleeveLength,
            ),
          ),
          SizedBox(width: 16,),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(),
                suffixText: "$lengthUnit"
              ),
              keyboardType: TextInputType.number,
              onChanged: (newLength) {
                calculateTotalLength();
                calculateTotalCost();
              },
              controller: bodyLength,
            ),
          )
        ]
      ),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0
            )
          ),
          prefixText: "Total Length",
          prefixStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
            child: Icon(
              Icons.straighten,
              color: Color(0xFF4527A0),
              size: 24.0
            ), // myIcon is a 48px-wide widget.
          ),
          fillColor: Color(0xFFF6F4FA),
          filled: true,
          suffixText: "$lengthUnit"
        ),
        readOnly: true,
        controller: totalLength,
      ),
    ];
  }

  List<Widget> fabricCostRow() {
    return [
      Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Length Price",
                border: OutlineInputBorder(),
                suffixText: "USD/$lengthUnit"
              ),
              keyboardType: TextInputType.number,
              onChanged: (newPrice) {
                calculateWeightPrice();
                calculateTotalCost();
              },
              controller: lengthPrice,
            ),
          ),
          SizedBox(width: 16.0,),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Weight Price",
                border: OutlineInputBorder(),
                suffixText: "USD/$weightUnit"
              ),
              keyboardType: TextInputType.number,
              onChanged: (newPrice) {
                calculateLengthPrice();
                calculateTotalCost();
              },
              controller: weightPrice,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: "Roboto"
              ),
            ),
          )
        ],
      ),
      TextField(
        decoration: InputDecoration(
          labelText: "Unit Length Weight",
          border: OutlineInputBorder(),
          suffixText: "$weightUnit/$lengthUnit"
        ),
        keyboardType: TextInputType.number,
        onChanged: (newWeight) {
          calculateWeightPrice();
        },
        controller: unitLengthWeight,
      ),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0
            )
          ),
          prefixText: "Total Cost",
          prefixStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
            child: Icon(
              Icons.attach_money,
              color: Color(0xFF4527A0),
              size: 24.0
            ), // myIcon is a 48px-wide widget.
          ),
          fillColor: Color(0xFFF6F4FA),
          filled: true,
          suffixText: "USD",
        ),
        readOnly: true,
        controller: totalCost,
      ),
    ];
  }

  List<Widget> buttonRow() {
    return [
      ButtonTheme(
        minWidth: double.infinity,
        height: 36,
        child: RaisedButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    ),
                  ),
                  height: 172,
                  padding: EdgeInsets.all(18 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Calculation's name",
                          hintText: "Untitled calculation",
                          border: OutlineInputBorder()
                        ),
                        controller: name,
                        autofocus: true,
                      ),
                    ],
                  )
                );
              }
            );
          },
          textColor: Colors.white,
          child: Text(
            "Save Calculations".toUpperCase(), 
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          color: Color(0xFF4527A0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        )
      )
    ];
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
                (fabricUsageRow() +
                fabricCostRow() +
                buttonRow()).map<Widget>((f) => 
                  Padding(
                    padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
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