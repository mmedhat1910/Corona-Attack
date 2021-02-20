import 'package:corona_attack/constants.dart';
import 'package:corona_attack/screens/country_feed.dart';
import 'package:corona_attack/screens/info_screen.dart';
import 'package:corona_attack/screens/world_feed.dart';
import 'package:corona_attack/size_config.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget activeScreen = WorldFeed();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xffeeeeee),
          height: Platform.isIOS ? 75 : 60,
          items: <Widget>[
            Icon(Icons.language, size: 35),
            Icon(Icons.search, size: 35),
            Icon(Icons.info_outline, size: 35),
          ],
          onTap: (index) {
            setState(() {
              if (index == 0) {
                setState(() {
                  activeScreen = WorldFeed();
                });
              } else if (index == 1) {
                setState(() {
                  activeScreen = CountryFeed();
                });
              } else {
                setState(() {
                  activeScreen = InfoScreen();
                });
              }
            });
          },
          animationDuration: Duration(milliseconds: 250),
          animationCurve: Curves.easeInOut,
          index: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: getPercentageOfHeight(4)),
              height: getPercentageOfHeight(13.5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffcccccc),
                    offset: Offset(5.0, 0.8),
                    blurRadius: 30,
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 50,
                    ),
                  ),
                  Text(
                    'Corona Attack',
                    style: kHeader2,
                  ),
                  IconButton(
                    icon: Icon(Icons.brightness_6),
                    onPressed: () {},
                    color: Colors.black,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: activeScreen,
            ))
          ],
        ),
      ),
    );
  }
}
