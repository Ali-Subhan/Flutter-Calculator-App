import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculatorassignmentdesign/Solver/evaluator.dart';
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  String expression;
  double result;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _equationArea(),
            _resultArea(),
            _buttonsArea(),
          ],
        ),
      ),
    );
  }
  _equationArea(){
    return Container(
      height: 65,
      //width: 400,
      margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.only(right: 30,left: 20),
        child: Text( expression ?? '',style: TextStyle(fontSize: 30,color: Colors.grey[500],fontWeight: FontWeight.bold)));
  }
  _resultArea(){
    return Container(
        height: 75,
        //width: 400,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.only(right: 30,left: 20),
        child: Text(result == null ? '' : result.toString(),style: TextStyle(fontSize: 40,color: Colors.grey[700],fontWeight: FontWeight.bold),));
  }
  _buttonsArea(){
    return Expanded(
      child: Container(
        //height: 250,
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _operatorButtons('+'),
                _operatorButtons('-'),
                _operatorButtons('*'),
                _operatorButtons('/'),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _numButtons('7'),
                _numButtons('8'),
                _numButtons('9'),
                _clearAllButton(),
              ],
            ),
            //SizedBox(height: 10,),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _numButtons('4'),
                      //SizedBox(height: 10,),
                      _numButtons('1'),
                      //SizedBox(height: 10,),
                      _numButtons('0'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _numButtons('5'),
                      //SizedBox(height: 10,),
                      _numButtons('2'),
                      //SizedBox(height: 10,),
                      _numButtons('.'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _numButtons('6'),
                      //SizedBox(height: 10,),
                      _numButtons('3'),
                      //SizedBox(height: 10,),
                      _eraseButton(),
                    ],
                  ),
                  _equalButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  _numButtons(text){
    return MaterialButton(
      onPressed: () {
        setState(() {
          if (expression != null) {
            expression = '$expression$text';
          } else {
            expression = text;
          }
          print(expression);
        });
      },
      height: 80,
      shape: CircleBorder(),
      color: Colors.grey[200],
      child: Text(text,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize:20),),
    );
  }
  _operatorButtons(text){
    return MaterialButton(
      onPressed: () {
        setState(() {
          expression = '$expression$text';
        });
      },
      height: 80,
      shape: CircleBorder(),
      color: Colors.lightBlue[100],
      child: Text(text,style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.bold,fontSize:25),),
    );
  }
  _clearAllButton(){
    return MaterialButton(
      onPressed: () {
        setState(() {
          expression = '';
          result = null;
        });
      },
      height: 80,
      shape: CircleBorder(),
      color: Colors.red[100],
      child: Text('C',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize:30),),
    );
  }
  _equalButton(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.green[100], borderRadius: BorderRadius.circular(40)),
      child: MaterialButton(
        onPressed: (){final resultVal = CalculatorBrain.evaluateExpression(expression);
        setState(() {
          result = resultVal;
        });},
        //height: 280,
        //minWidth: 80,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        //color: Colors.green[100],
        child: Center(
            child: Text('=',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize:40),)),
      ),
    );
  }
  _eraseButton(){
    return MaterialButton(
      onPressed: () {
        if (expression != null && expression.length > 0) {
          setState(() {
            expression = expression.substring(0, expression.length - 1);
          });
        }
      },
      height: 80,
      shape: CircleBorder(),
      color: Colors.orange[100],
      child: Icon(Icons.backspace,color: Colors.orange,size: 20,),
    );
  }

}
