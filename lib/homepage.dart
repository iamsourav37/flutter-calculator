import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result;
  int num1, num2;
  String textToDisplay = "";
  String operatorToPerform;

  void onButtonPressed(String btnVal) {
    debugPrint("$btnVal");

    if (btnVal == "C") {
      this.textToDisplay = "";
      result = "";
      num1 = null;
      num2 = null;
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '*' ||
        btnVal == '/') {
      num1 = int.parse(textToDisplay);
      result = "";
      operatorToPerform = btnVal;
    } else if (btnVal == '=') {
      num2 = int.parse(textToDisplay);
      if (operatorToPerform == "+") result = (num1 + num2).toString();
      if (operatorToPerform == "-") result = (num1 - num2).toString();
      if (operatorToPerform == "*") result = (num1 * num2).toString();
      if (operatorToPerform == "/") result = (num1 ~/ num2).toString();
    } else {
      result = textToDisplay + btnVal;
    }

    setState(() {
      textToDisplay = result;
    });
  }

  Widget customButton(String btnVal) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: OutlineButton(
          onPressed: () {
            this.onButtonPressed(btnVal);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.all(17),
          child: Text(
            btnVal,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                textToDisplay,
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("*"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
