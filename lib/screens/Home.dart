import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Center(
            child: Image(
              image: AssetImage('assets/PeppaPig_Practice2.gif'),
              height: 250.0,
              width: 250.0,
            ),
          ),

          Text(
            'Hello there and welcome to our app!\nAnd I am Peppa Pig',
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: Colors.black,
              letterSpacing: 2,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}