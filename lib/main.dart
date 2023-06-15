import 'package:appy/InterstitialAdPage.dart';
import 'package:appy/splash.dart';
import 'package:flutter/material.dart';
import 'package:appy/loading.dart';
import 'package:appy/win.dart';
import 'package:appy/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/splash',
  routes: {
    '/splash': (context) => const Splash(),
    '/home': (context) => const Home(),
    '/location': (context) => const Loading(),
    '/win': (context) => const Win(value: ''),
    '/iap': (context) => const InterstitialAdPage(),

  },

   ),
);