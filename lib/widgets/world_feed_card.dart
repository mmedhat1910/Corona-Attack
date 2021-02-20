import 'package:corona_attack/constants.dart';
import 'package:corona_attack/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:humanize/humanize.dart' as humanize;

class WorldFeedCard extends StatelessWidget {
  const WorldFeedCard({
    Key key,
    @required this.isLoading,
    @required this.data,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final bool isLoading;
  final int data;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5), blurRadius: 20, color: Colors.grey[300])
          ]),
      width: double.infinity,
      height: 120,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              // left: getPercentageOfWidth(25),
              right: 20,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                ),
                SizedBox(width: 5),
                Text(
                  title,
                  style: kHeader3,
                ),
              ],
            ),
          ),
          !isLoading
              ? Text(humanize.intComma(data).toString(), style: kHeader2)
              : Container(),
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[200],
                  highlightColor: Colors.grey[100],
                  child: Container(
                    width: getPercentageOfWidth(60),
                    height: 20,
                    color: Colors.grey,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
