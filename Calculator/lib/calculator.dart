import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();

}

class _CalculatorState  extends State<Calculator>{
  Widget numButton(String btnText,Color btnColor,Color txtColor){
    return ElevatedButton(
      onPressed: () => {},
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
  }//NumberButton


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true ,
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
                    "0",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80
                    ),
                  ),

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", (Colors.grey[850])!, Colors.white),
                numButton("+/-", (Colors.grey[850])!, Colors.white),
                numButton("%", (Colors.grey[850])!, Colors.white),
                numButton("/", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", (Colors.grey[850])!, Colors.white),
                numButton("8",(Colors.grey[850])! , Colors.white),
                numButton("9", (Colors.grey[850])!, Colors.white),
                numButton("X", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", (Colors.grey[850])!, Colors.white),
                numButton("5", (Colors.grey[850])!, Colors.white),
                numButton("6", (Colors.grey[850])!, Colors.white),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", (Colors.grey[850])!, Colors.white),
                numButton("2", (Colors.grey[850])!, Colors.white),
                numButton("3", (Colors.grey[850])!, Colors.white),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 35,color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: (Colors.grey[850])!,
                  ),
                ),
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
}