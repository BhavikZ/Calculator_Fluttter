import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () =>
      {
        HapticFeedback.heavyImpact(),
        calculate(btnText)
      }, //on presed
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
    );
  } //NumberButton

  Widget zero(String btnText) {
    return ElevatedButton(
      onPressed: () => {calculate(btnText)},
      child: Padding(
        padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: (Colors.grey[850])!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    history,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 30),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                   text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 70),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey.shade500, Colors.black),
                numButton("+/-", Colors.grey.shade500, Colors.black),
                numButton("%", Colors.grey.shade500, Colors.black),
                numButton("/", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", (Colors.grey[850])!, Colors.white),
                numButton("8", (Colors.grey[850])!, Colors.white),
                numButton("9", (Colors.grey[850])!, Colors.white),
                numButton("X", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", (Colors.grey[850])!, Colors.white),
                numButton("5", (Colors.grey[850])!, Colors.white),
                numButton("6", (Colors.grey[850])!, Colors.white),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", (Colors.grey[850])!, Colors.white),
                numButton("2", (Colors.grey[850])!, Colors.white),
                numButton("3", (Colors.grey[850])!, Colors.white),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                zero("0"),
                numButton(".", (Colors.grey[850])!, Colors.white),
                numButton("=", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  //Logic of Calculator

  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";
  String history = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      firstNumber = 0;
      secondNumber = 0;
      result = "";
      text = "";
      history="";
    }else if(btnText=="+/-"){
      if(text[0]!='-'){
        result="-"+text;
      }
      else
        {
          result=text.substring(1);
        }
    }
    else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "X" ||
        btnText == "/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    }else if(btnText == "="){
      secondNumber = int.parse(text);
      if(operation == "+"){
        result = (firstNumber+secondNumber).toString();
        history=firstNumber.toString()+operation.toString()+secondNumber.toString();
      }
      if(operation == "-"){
        result = (firstNumber-secondNumber).toString();
        history=firstNumber.toString()+operation.toString()+secondNumber.toString();
      }
      if(operation == "X"){
        result = (firstNumber*secondNumber).toString();
        history=firstNumber.toString()+operation.toString()+secondNumber.toString();
      }
      if(operation == "/"){
        result = (firstNumber/secondNumber).toString();
        history=firstNumber.toString()+operation.toString()+secondNumber.toString();
      }
    }else{
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}