import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdPage extends StatefulWidget {
  const InterstitialAdPage({Key? key}) : super(key: key);

  @override
  State<InterstitialAdPage> createState() => _InterstitialAdState();
}

class _InterstitialAdState extends State<InterstitialAdPage> {

  @override
  void initState(){
    super.initState();
    initInterstitialAd();
  }
  late InterstitialAd interstitialAd;
  bool isAdLoaded = false;

  initInterstitialAd(){
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',//test
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interstitial Ad"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
             if(isAdLoaded) {
               print("YES");
               interstitialAd.show();
              }
             else  print("noo");
          },
          child: const Text('Task Completed'),
        ),
      ),
    );
  }
}



