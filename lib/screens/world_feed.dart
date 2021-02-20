import 'package:corona_attack/constants.dart';
import 'package:corona_attack/size_config.dart';
import 'package:corona_attack/widgets/world_feed_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class WorldFeed extends StatefulWidget {
  @override
  _WorldFeedState createState() => _WorldFeedState();
}

class _WorldFeedState extends State<WorldFeed> {
  var worldData = {};
  bool isLoading = false;
  void getData() async {
    isLoading = true;
    var worldResponse = await http.get('$kURL/all');
    isLoading = false;
    if (worldResponse.statusCode == 200) {
      setState(() {
        worldData = convert.jsonDecode(worldResponse.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/world.png'),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getPercentageOfWidth(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'World Feed',
                  style: kHeader2,
                ),
                SizedBox(height: getPercentageOfHeight(3)),
                WorldFeedCard(
                  isLoading: isLoading,
                  data: worldData['cases'],
                  title: 'Cases',
                  icon: Icons.person,
                ),
                SizedBox(height: getPercentageOfHeight(2)),
                WorldFeedCard(
                  isLoading: isLoading,
                  data: worldData['recovered'],
                  title: 'Recovered',
                  icon: Icons.check,
                ),
                SizedBox(height: getPercentageOfHeight(2)),
                WorldFeedCard(
                  isLoading: isLoading,
                  data: worldData['deaths'],
                  title: 'Deaths',
                  icon: Icons.report_gmailerrorred_outlined,
                ),
                SizedBox(height: getPercentageOfHeight(2)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
