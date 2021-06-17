import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:spacex_latest_launch/Const.dart';
import 'package:spacex_latest_launch/Model/LaunchModel.dart';
import 'package:spacex_latest_launch/View/Widgets/OpenLinkConfirmer.dart';

class LaunchDetails extends StatelessWidget {
  final LaunchModel item;

  LaunchDetails(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            child: Hero(
              tag: "logo",
              child: Image.network(
                "${item.links.patch.small}",
              ),
            ),
            margin: EdgeInsets.only(bottom: 8),
          ),
          Container(
            child: Text(
              "${item.name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Container(
            child: Text(
              "${item.details}",
            ),
            margin: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Container(
            width: double.infinity,
            child: Text(
              "${DateFormat('MM/dd/yyyy – kk:mm:ss').format(item.dateUtc)}",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black54,
              ),
            ),
            margin: EdgeInsets.only(right: 8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (item.links.youtubeId.isNotEmpty)
                RoundedIconButton(
                  FontAwesome.youtube_play,
                  "https://www.youtube.com/watch?v=${item.links.youtubeId}",
                  "Watch on YouTube",
                  kYoutubeColor,
                ),
              if (item.links.reddit.launch.isNotEmpty)
                RoundedIconButton(
                  FontAwesome.reddit_square,
                  item.links.reddit.launch,
                  "Read on Reddit",
                  kRedditColor,
                ),
              if (item.links.wikipedia.isNotEmpty)
                RoundedIconButton(
                  FontAwesome.wikipedia_w,
                  item.links.wikipedia,
                  "Read on Wikipedia",
                  kWikipediaColor,
                ),
            ],
          ),
          // Container(
          //   child: ElevatedButton(
          //     //
          //     child: Text("View Details"),
          //   ),
          //   margin: EdgeInsets.only(top: 8.0),
          // ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final String tooltip, link;
  final IconData icon;
  final Color color;

  RoundedIconButton(
    this.icon,
    this.link,
    this.tooltip,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        tooltip: tooltip,
        splashRadius: 25,
        onPressed: () => showSnackBar(link, context),
      ),
    );
  }
}
