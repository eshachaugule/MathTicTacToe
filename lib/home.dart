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
                    /*-------------------------------Container(
                      height: 50.0,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints:
                            BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Gradient Button",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),*/
                        /*ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/location');
                          },
                          icon: const Icon(
                              Icons.mail
                          ),
                          label: const Text('mailme'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                        ),*/
                    ]
    ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          /*DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.lime,
                              fontSize: 20.0,
                              fontFamily: 'DancingScript',
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(30.0),
                              color: Colors.purple,
                              child: const Text('one'),
                            ),
                          ),*/

                          /*DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.lime,
                              fontSize: 20.0,
                              fontFamily: 'DancingScript',
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(40.0),
                              color: Colors.brown,
                              child: const Text('two'),
                            ),
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.lime,
                              fontSize: 20.0,
                              fontFamily: 'DancingScript',
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(50.0),
                              color: Colors.pink,
                              child: Text('$number'),
                            ),
                          ),*/
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

      /*appBar: AppBar(
        title: const Text('Math Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text(
          'With Friend',
            style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey,
            fontFamily: 'DancingScript',
            )
        ),

        child: Image(
          image: AssetImage('assets/backgroundimage.jpg'),
        ),
        child: Icon(
          Icons.airport_shuttle,
          color: Colors.lightBlue,
          size: 50.0,
        ),
        child: ElevatedButton(
          onPressed: () {
              print('you fsjdjfd');
            },
          child: Text('CLICKKKK'),
        style: ElevatedButton.styleFrom(primary: Colors.black),

        ),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.mail
          ),
          label: Text('mailme'),
          style: ElevatedButton.styleFrom(primary: Colors.amber),
        ),
        child: IconButton(
          icon: const Icon(Icons.volume_up),
       tooltip: 'Increase volume by 10',
        onPressed: () {print('fyuuuuuu');},
          color: Colors.amber,
        ),

    ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        margin: EdgeInsets.all(30.0),
        color: Colors.grey[400],
        child: Text('hello'),
      ),*/
      /*body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image(
            image: AssetImage('assets/wallpaper3.jpg'),
          ),
          Text('I First Row'),
          ElevatedButton(
          onPressed: () {     },
            child: Text('I Elevated Button'),
          style: ElevatedButton.styleFrom(primary: Colors.black),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.0),
            margin: EdgeInsets.fromLTRB(1.0, 30.0, 1.0, 30.0),
            color: Colors.grey[400],
            child: Text('I Container'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('hello,'),
              Text(' world'),
            ],
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.purple,
            child: Text('one'),
          ),
          Container(
            padding: EdgeInsets.all(40.0),
            color: Colors.brown,
            child: Text('two'),
          ),
          Container(
            padding: EdgeInsets.all(50.0),
            color: Colors.deepOrange,
            child: Text('three'),
          ),
        ]
      ),*/

    )
    );
  }
}

