import 'package:appy/InterstitialAdPage.dart';
import 'package:flutter/material.dart';
import 'package:appy/win.dart';
import 'package:appy/dialogbox.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-5523026977500112/8151031145',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );


  @override
  void initState() {
    super.initState();
    myBanner.load();
  }
  String value = 'Screen 1 Data';
  String turn = 'X';
  String turntext = '';
  bool keeptrack = true;
  int track = 1;
  late num flag;
  int isPressedNum = 0;
  late String button;
  String button1 = '';
  String button2 = '';
  String button3 = '';
  String button4 = '';
  String button5 = '';
  String button6 = '';
  String button7 = '';
  String button8 = '';
  String button9 = '';
  bool _isPressed1 = false;
  bool _isPressed2 = false;
  bool _isPressed3 = false;
  bool _isPressed4 = false;
  bool _isPressed5 = false;
  bool _isPressed6 = false;
  bool _isPressed7 = false;
  bool _isPressed8 = false;
  bool _isPressed9 = false;

  int i = 0;
  int j = 0;
  List<String> operators = ['+', '-', '*', '/'];

  _navigatetohome(turn)async{
    await Future.delayed(const Duration(milliseconds: 750), () {});
    Navigator.of(context).push( MaterialPageRoute(builder: (context) =>
    Win(value: turn),
   ));
  }

  int checkwin()
  {
    if (button1 == button2 && button2 == button3 && (button3 == 'X' || button3 ==  'O'))
    {
      return 1;
    }
    else if (button4 == button5 && button5 == button6 && (button6 == 'X' || button6 ==  'O'))
    {
      return 1;
    }
    else if (button7 == button8 && button8 == button9 && (button9 == 'X' || button9 ==  'O'))
    {
      return 1;
    }
    else if (button1 == button4 && button4 == button7 && (button7 == 'X' || button7 ==  'O'))
    {
      return 1;
    }
    else if (button2 == button5 && button5 == button8 && (button8 == 'X' || button8 ==  'O'))
    {
      return 1;
    }
    else if (button3 == button6 && button6 == button9 && (button9 == 'X' || button9 ==  'O'))
    {
      return 1;
    }
    else if (button1 == button5 && button5 == button9 && (button9 == 'X' || button9 ==  'O'))
    {
      return 1;
    }
    else if (button3 == button5 && button5 == button7 && (button7 == 'X' || button7 ==  'O'))
    {
      return 1;
    }
    else if (track == 10)
    {
      return 0;
    }
    else
    {
      return  - 1;
    }
  }

  Future<String> _myCallback(isPressedNum) async {

      flag = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const MathDialog(),
      );

      setState(() {
        button = '';

        if(flag == 1.0) {

          track += 1;
          print('Trackkkkkkk: $track');

          button = (keeptrack) ? 'X' : 'O';
          if(isPressedNum == 1)
          {
            _isPressed1 = true;
            button1 = button;
          }
          else if(isPressedNum == 2)
          {
            _isPressed2 = true;
            button2 = button;
          }
          else if(isPressedNum == 3)
          {
            _isPressed3 = true;
            button3 = button;
          }
          else if(isPressedNum == 4)
          {
            _isPressed4 = true;
            button4 = button;
          }
          else if(isPressedNum == 5)
          {
            _isPressed5 = true;
            button5 = button;
          }
          else if(isPressedNum == 6)
          {
            _isPressed6 = true;
            button6 = button;
          }
          else if(isPressedNum == 7)
          {
            _isPressed7 = true;
            button7 = button;
          }
          else if(isPressedNum == 8)
          {
            _isPressed8 = true;
            button8 = button;
          }
          else if(isPressedNum == 9)
          {
            _isPressed9 = true;
            button9 = button;
          }

          i = checkwin();


          if (i == 1) {
            turn = 'Winner is: $button!!!';

            _navigatetohome(turn);
          }
          else if (i == 0) {
            turn = 'DRAW...';

            _navigatetohome(turn);
          }

        }
        keeptrack = !keeptrack;
      });

return button;
  }

  @override
  Widget build(BuildContext context) {

    turn = (keeptrack) ? 'Turn: X' : 'Turn: O';

    return Stack(


        children: <Widget>[

          Align(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/wallpaper.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Align(

              alignment: Alignment.topLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                          DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.lime,
                              fontSize: 69.0,
                              fontFamily: 'EBGaramond',
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.0),
                              margin: const EdgeInsets.fromLTRB(98.0, 100.0, 1.0, 30.0),


                              child: Text(turn),
                            ),
                          ),
                  ]
              )
          ),

          Align(

              alignment: Alignment.topLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[

                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(


                            onPressed: () async => _isPressed1 == false ? button1=await _myCallback(1): null,

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                                  side: const BorderSide(width:3, color:Colors.black87), //border width and color
                                  elevation: 5, //elevation of button
                              ),


                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'EBGaramond',
                              ),
                              child: Text(button1),

                            ),


                          ),

                        ),
                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed2 == false ? button2=await _myCallback(2): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),

                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'EBGaramond',
                              ),
                              child: Text(button2),

                            ),
                          ),

                        ),
                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed3 == false ? button3=await _myCallback(3): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),

                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'EBGaramond',
                              ),
                              child:  Text(button3),

                            ),
                          ),

                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[

                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed4 == false ? button4=await _myCallback(4): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),

                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'EBGaramond',
                              ),
                              child:  Text(button4),

                            ),
                          ),

                        ),
                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed5 == false ? button5=await _myCallback(5): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),

                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'EBGaramond',
                              ),
                              child:  Text(button5),

                            ),
                          ),

                        ),
                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed6 == false ? button6=await _myCallback(6): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),

                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'EBGaramond',
                              ),
                              child: Text(button6),

                            ),
                          ),

                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[

                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed7 == false ? button7=await _myCallback(7): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),

                            child: DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'EBGaramond',
                              ),
                              child:  Text(button7),

                            ),
                          ),

                        ),
                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed8 == false ? button8=await _myCallback(8): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),


                            child: DefaultTextStyle(
                                        style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40.0,
                                        fontFamily: 'EBGaramond',
                                        ),
                                        child: Text(button8),

                                ),
                          ),

                        ),
                        SizedBox(
                          height:100, //height of button
                          width:100,

                          child: ElevatedButton(
                            onPressed: () async => _isPressed9 == false ? button9=await _myCallback(9): null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, disabledForegroundColor: Colors.redAccent, disabledBackgroundColor: Colors.redAccent, //background color of button
                              side: const BorderSide(width:3, color:Colors.black87), //border width and color
                              elevation: 5, //elevation of button
                            ),

                            child: DefaultTextStyle(
                                    style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40.0,
                                    fontFamily: 'EBGaramond',
                                    ),
                                    child:  Text(button9),

                                    ),
                          ),
                        ),
                      ],
                    ),


                    Container(
                        padding: const EdgeInsets.fromLTRB(1.0, 170.0, 1.0, 0.0),

                        child: SizedBox(
                          height: 70.0,
                          width: 540.0,

                          child: AdWidget(ad: myBanner, )
                    )
                    )
              ]
              )
          ),
        ]
    );
  }
}
