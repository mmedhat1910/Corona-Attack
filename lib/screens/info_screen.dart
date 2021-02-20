import 'package:corona_attack/constants.dart';
import 'package:corona_attack/size_config.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getPercentageOfWidth(10),
          vertical: getPercentageOfHeight(2)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            Text(
              'About this app',
              style: kHeader2,
            ),
            SizedBox(height: getPercentageOfHeight(3)),
            Text(
              'API',
              style: kHeader3,
            ),
            Divider(),
            Text(
              'Attributions',
              style: kHeader3,
            ),
            Divider(),
            Text(
              'Honorable Mentions',
              style: kHeader3,
            )
          ],
        ),
      ),
    );
  }
}
