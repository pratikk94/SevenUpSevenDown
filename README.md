#Instructions
1. Copy Images to the root directory under the name of images.
2. Uncomment line 48,49 in pubspec.yaml and show the path to images directory.
3. Add images array to main.dart
   var imageArray = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png', 'six.png'];
   
4. Add color of the background screen
   var color = Colors.white;
   
5. Add two variables to initialize values on the cube when program first runs.
   int randomIntForDiceOne = Random().nextInt(6);
   int randomIntForDiceTwo = Random().nextInt(6);
   
6. Add Row widget.
   Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
            Image.asset('images/'+imageArray[randomIntForDiceOne], height: 150, width: 150,),
            Image.asset('images/'+imageArray[randomIntForDiceTwo], height: 150, width: 150,),
      ],
   )
   
7. Add button to change the number on the dice
   Padding(
      padding: const EdgeInsets.only(top: 60),
      child: ElevatedButton(onPressed: changeImage,child: Text('Roll Dice')),
   )
   
8. Define method changeImage
   void changeImage() {
      setState(() {
         randomIntForDiceOne = Random().nextInt(6);
         randomIntForDiceTwo = Random().nextInt(6);
      });
   }

9. Modify method changeImage() for accepting 3 inputs
   void changeImage(int inputType){
      setState(() {
         randomIntForDiceOne = Random().nextInt(6);
         randomIntForDiceTwo = Random().nextInt(6);
         //be very careful of +2
         var sum = randomIntForDiceOne + randomIntForDiceTwo + 2;
         print("Sum is $sum");
      
         if(inputType==0) {
            if (sum < 7) {
               color = Colors.green;
            }
            else {
               color = Colors.red;
            }
         }
         if(inputType==1) {
            if (sum==7) {
               color = Colors.green;
            }
            else {
               color = Colors.red;
            }
         }
         if(inputType==2) {
            if (sum > 7) {
               color = Colors.green;
            }
            else {
                color = Colors.red;
            }
         }
      
      });
   }
   
10. Add 3 buttons for 7up 7Down and equals to 7
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
       ]
    ),