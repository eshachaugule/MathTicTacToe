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