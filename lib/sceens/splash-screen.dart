import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:calculatorassignmentdesign/sceens/claculator-screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _transitionPeriod();
    super.initState();
  }
  _transitionPeriod()async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CalculatorScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Center(
        child: Container(
          height: 300,
          width: 250,
          //padding: EdgeInsets.all(120),
          color: Colors.grey[300],
          //decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('+',style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.black),),
                  Text('-',style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.black)),
                ],
              ),
              Text('.|.',style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.black)),
              Text('=',style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.black)),
              //Row(children: <Widget>[Text('.|.')],),
              //Row(children: <Widget>[Text('=')],)
            ],
          ),
        ),
      ),
    );
  }

  }

