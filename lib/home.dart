import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/link.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int number = 1;


  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit the game?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:const Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(

      onWillPop: showExitPopup,
      child: Stack(

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
                              image: AssetImage('assets/mathbg.jpg'),
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

                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    /*ElevatedButton(
                          onPressed: ()  {
                            setState(() {
                              number += 1;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),*/
                        DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 50.0,
                              fontFamily: 'EBGaramond',
                            ),
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            margin: const EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 180.0),
                            child: const Text('MATH\n'
                                'TIC TAC TOE',
                            textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ]
    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/location');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                textStyle: const TextStyle(fontFamily: 'EBGaramond', fontSize: 40),
                                shadowColor: Colors.black87,
                            elevation: 20),
                            child: const Text('PLAY'),
                          ),
                        ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Link(
                      target: LinkTarget.blank,
                      uri: Uri.parse('https://sites.google.com/view/mathtictactoe/home'),
                      builder: (context, followLink) =>
                        ElevatedButton.icon
                  (
                        onPressed:  followLink,             //Navigator.pushNamed(context, '/roo');
                        icon: const Icon(
                            Icons.privacy_tip_outlined
                        ),
                        label: const Text(''),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white10),
                      ),
                    ),
                    ]
              )
              ]
              )
          )
        ]
    )
    );
  }
}