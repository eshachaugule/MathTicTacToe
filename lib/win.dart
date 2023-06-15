import 'package:flutter/material.dart';
import 'package:appy/loading.dart';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:appy/InterstitialAdPage.dart';

class Win extends StatefulWidget {
  final String value;

  const Win({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {

  @override
  void initState(){
    super.initState();
    initInterstitialAd();
  }
  late InterstitialAd interstitialAd;
  bool isAdLoaded = false;

  initInterstitialAd(){
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-5523026977500112/8244182877',//real
      //adUnitId: 'ca-app-pub-3940256099942544/1033173712',//test
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad){
          interstitialAd = ad;
          setState(() {
            isAdLoaded = true;
            print("hehe");
          });
        },
        onAdFailedToLoad: ((error) {
          interstitialAd.dispose();
          print("oh");
        }
        ),
      ),
    );
  }


  Future<bool> showExitPopup() async {
    int count = 0;

    Navigator.popUntil(context, (route) {
      return count++ == 2;
    });
    Navigator.pushNamed(context, '/location').then((_) {
      setState(() {
        // Call setState to refresh the page.
      });
    });
    return Future.value(true);
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
                    Row(
                        children: <Widget>[
                          DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.lime,
                              fontSize: 39.0,
                              fontFamily: 'DancingScript',
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1.0, vertical: 10.0),
                              margin: const EdgeInsets.fromLTRB(
                                  98.0, 100.0, 1.0, 30.0),


                              child: Text(widget.value),
                            ),

                          ),
                        ]
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if(isAdLoaded) {
                          print("YES");
                          interstitialAd.show();
                        }
                        else  print("noo");
                        //Navigator.pushNamed(context, '/roo');
                   int count = 0;
                    Navigator.popUntil(context, (route) {
                  return count++ == 2;
                  });
                   Navigator.pushNamed(context, '/location').then((_) {
                          // This block runs when you have returned back to the 1st Page from 2nd.
                   setState(() {
                            // Call setState to refresh the page.
                   });
                });

                      },

                      icon: const Icon(
                          Icons.add_circle_outline
                      ),
                      label: const Text('Play new game'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                    ),

                  ]

              )
          ),
        ]
        )
    );
  }
}
