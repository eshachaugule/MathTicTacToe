import 'package:flutter/material.dart';
import 'dart:math';


class MathDialog extends StatefulWidget {
  const MathDialog({Key? key}) : super(key: key);

  @override
  State<MathDialog> createState() => _MathDialogState();
}

class _MathDialogState extends State<MathDialog> {

  @override
  Widget build(BuildContext context) {


    var intValue1 = Random().nextInt(100);
    var intValue2 = 1 + Random().nextInt((10 + 1)-1);
    var randdiv = Random().nextInt(10);
    var intdivValue = 1 + Random().nextInt((10 + 1)-1);
    var mcq1 = Random().nextInt(100);
    var mcq2 = Random().nextInt(100);
    int ans = 0;
    num flag;
    List<String> operators = ['+', '-', '*', '/'];

    operators.shuffle();
    String operator = (operators[0]);

    if(operator == '+')
    {
      ans = intValue1 + intValue2;
    }
    else if(operator == '-')
    {
      ans = intValue1 - intValue2;
    }
    else if(operator == '*')
    {
      ans = intValue1 * intValue2;
    }
    else if(operator == '/')
    {
      intValue1 = randdiv * intValue2;
      ans = randdiv;
    }

    List<int> mcqs = [mcq1, mcq2, ans];

    mcqs.shuffle();
    var charmcqs0 = mcqs[0];
    var charmcqs1 = mcqs[1];
    var charmcqs2 = mcqs[2];

            return WillPopScope(

                onWillPop: () async => false,
                child: AlertDialog(


                //title: Text('Welcome'),
              // To display the title it is optional
                  content: Text('$intValue1 $operator $intValue2'),
              // Message which will be pop up on the screen
              // Action widget which will provide the user to acknowledge the choice

              actions: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    flag = (charmcqs0 == ans) ? 1.0 : 0.0;
                    Navigator.pop(context, flag);
                  },
                  child: Text('$charmcqs0'),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    flag = (charmcqs1 == ans) ? 1.0 : 0.0;
                    Navigator.pop(context, flag);
                  },
                  child: Text('$charmcqs1'),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    flag = (charmcqs2 == ans) ? 1.0 : 0.0;
                    Navigator.pop(context, flag);
                  },
                  child: Text('$charmcqs2'),

                ),

              ],
                )
            );
          }

}





//
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Test App",
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//
//     Future<bool> showExitPopup() async {
//       return await showDialog( //show confirm dialogue
//         //the return value will be from "Yes" or "No" options
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Exit App'),
//           content: Text('Do you want to exit an App?'),
//           actions:[
//             ElevatedButton(
//               onPressed: () => Navigator.of(context).pop(false),
//               //return false when click on "NO"
//               child:Text('No'),
//             ),
//
//             ElevatedButton(
//               onPressed: () => Navigator.of(context).pop(true),
//               //return true when click on "Yes"
//               child:Text('Yes'),
//             ),
//
//           ],
//         ),
//       )??false; //if showDialouge had returned null, then return false
//     }
//
//     return WillPopScope(
//         onWillPop: showExitPopup, //call function on back button press
//         child:Scaffold(
//             appBar: AppBar(
//               title: Text("Override Back Button"),
//               backgroundColor: Colors.redAccent,
//             ),
//             body: Center(
//               child: Text("Override Back Buttton"),
//             )
//         )
//     );
//   }
// }
