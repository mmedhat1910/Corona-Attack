import 'dart:async';

import 'package:corona_attack/constants.dart';
import 'package:corona_attack/screens/home_screen.dart';
import 'package:corona_attack/size_config.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isLoading = true;
  var worldData = {};
  var countriesData = [];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, a, b) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/images/logo.png',
              width: 300,
            ),
          ),
          SizedBox(height: 10),
          Text('Corona Attack', style: kHeader1),
          Loading(indicator: BallPulseIndicator(), size: 60.0, color: kPurple)
        ],
      ),
    );
  }
}
