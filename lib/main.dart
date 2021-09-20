import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Anjali\'s First App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Step 1
  var imageArray = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png', 'six.png'];

  //Step 2 : This will be the background of the initial screen
  var color = Colors.white;

  //Step 3 : Initialize the variables to show on the top of the cube when game starts
  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);

  //Step 9 : Score Variable
  int score = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //Step 2 : Color of the background
        backgroundColor: color,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(

              children: [
                //Step 10: Show the score
                Padding(
                  padding: const EdgeInsets.only(bottom: 40,top: 20),
                  child: Text('Score is '+ (score.toString()),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                //Step 7 : Add the text field to sum the two number on the dice and show it on the screen
                Padding(
                  padding: const EdgeInsets.only(bottom: 60,top: 20),
                  child: Text('The sum is: '+ (randomIntForDiceOne + randomIntForDiceTwo + 2).toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                //Step 4 : Add row widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset('images/'+imageArray[randomIntForDiceOne], height: 150, width: 150,),
                    Image.asset('images/'+imageArray[randomIntForDiceTwo], height: 150, width: 150,),
                  ],
                ),
                /*
            //Step 5 : Add button to change the number on the dice
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ElevatedButton(onPressed : changeImage(0),child: Text('Roll Dice')),
            )
             */
                //Step 8 : Add 3 buttons. For more than 7 less than 7 and equals to 7.
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: ElevatedButton(onPressed : () => changeImage(0),child: Text('< 7')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: ElevatedButton(onPressed : () =>changeImage(1),child: Text('= 7')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: ElevatedButton(onPressed : () =>changeImage(2),child: Text('> 7')),
                      )
                    ]),

              ],
            )
        )
    );
  }
  /*
  Step 6 : Define method to change the number on the dice
  void changeImage() {
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
    });
  }
  */
  //Step 7
  void changeImage(int inputType){
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
      var sum = randomIntForDiceOne + randomIntForDiceTwo + 2;
      print("Sum is $sum");

      if(inputType==0) {
        if (sum < 7) {
          score = score + 10;
          color = Colors.green;
        }
        else {
          score = score - 10;
          color = Colors.red;
        }
      }
      if(inputType==1) {
        if (sum==7) {
          score = score + 50;
          color = Colors.green;
        }
        else {
          score = score - 10;
          color = Colors.red;
        }
      }
      if(inputType==2) {
        if (sum > 7) {
          score = score + 10;
          color = Colors.green;
        }

        else {
          score = score - 10;
          color = Colors.red;
        }
      }

    });
  }

}
