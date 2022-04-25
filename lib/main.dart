import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.teal.shade600,
          appBar: AppBar(
            centerTitle: (true),
            title: const Text('Dice game'),
            backgroundColor: Colors.teal.shade900,
          ),
          body: const Dicepage(),
        )),
  );
}

class Dicepage extends StatefulWidget {
  const Dicepage({Key? key}) : super(key: key);

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  //Dicepage({Key? key}) : super(key: key);
  // This widget is the root of your application.
  int leftdicenumber = 1;
  int rightdicenumber = 1;
  @override
  Widget build(BuildContext context) {
    void instruct() {
      rightdicenumber = Random().nextInt(6) + 1;
      leftdicenumber = Random().nextInt(6) + 1;
    }

    return Center(
      // this class dicepage returns a center widget into the body of the scaffold.
      child: Column(
        // a row widget is inserted in the center widget using the child property of the center widget
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // as usual a row&column have the children property to take other widget
          Row(children: <Widget>[
            Expanded(
              // the expanded widget in the row, allows for proportional ratio of what ever is insert to fit the screen in this case and image
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                    'images/dice$leftdicenumber.png' // this is a child of the expanded widget
                    ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('images/dice$rightdicenumber.png'))),
          ]),
          TextButton(
            onPressed: () {
              setState(() {
                instruct();
                //rightdicenumber = Random().nextInt(6) +1 ;
                //leftdicenumber = Random().nextInt(6) + 1;
              });
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(50.0),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                width: 110.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: const Text(
                  'TOSS',
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.teal,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Pacifico'
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//a variable or object that is bound to change state shouldn't be in a stateless widget
