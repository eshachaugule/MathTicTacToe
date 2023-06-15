import 'package:appy/InterstitialAdPage.dart';
import 'package:appy/splash.dart';
import 'package:flutter/material.dart';
import 'package:appy/loading.dart';
import 'package:appy/win.dart';
import 'package:appy/home.dart';

//dialog box for win, find a great way to refresh page, check corner cases while playing(no two mcqs same), validation for all operations, no 0's in operations,, esp divide,, put limit



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