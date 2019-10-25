import 'dart:math';

import 'package:profile_selection/data.dart';
import 'DetailPageRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color toFromTextColor = Color(0xFF6E6896);

TextStyle little = TextStyle(
  color: toFromTextColor,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  fontFamily: "Roboto",
  decoration: TextDecoration.none,
);
TextStyle big = TextStyle(
  color: toFromTextColor,
  fontWeight: FontWeight.bold,
  fontSize: 17,
  fontFamily: "Roboto",
  decoration: TextDecoration.none,
);

class PageWidget extends StatelessWidget {
  double distanceFromCenter = 0;
  User user;

  PageWidget(User flight, double distanceFromCenter) {
    this.distanceFromCenter = distanceFromCenter;
    this.user = flight;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle smallGrey = TextStyle(
        color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12);

    TextStyle bigRed = TextStyle(
        color: Color(0xFFB0548B), fontWeight: FontWeight.bold, fontSize: 42);

    return Stack(
     // overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Color(0xFF572F72), blurRadius: 20),
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: GestureDetector(
                onTap: () {
//                  Navigator.of(context).push(
//                    DetailPageRoute(flight),
//                  );
                },
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Hero(
                          tag: "background${user.id}",
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white),
                              )),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 25.0 / 23.0,
                            child: Hero(
                              tag: "image${user.id}",
                              child: Image(
                                image: AssetImage(user.url),
                              )
                            ),
                          ),
                          Hero(
                            tag: "info${user.id}",
                            flightShuttleBuilder: (
                                BuildContext flightContext,
                                Animation<double> animation,
                                HeroFlightDirection flightDirection,
                                BuildContext fromHeroContext,
                                BuildContext toHeroContext,
                                ) {
                              return Container();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: FlightInfo(user),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Avaiblity : ${user.available}",
                                  style: smallGrey,
                                ),
                                Text(
                                  "",

                                ),
                                    Icon(Icons.call),
                                    Icon(Icons.message)
                                  ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          padding: EdgeInsets.only(top: 40),
        ),
      ],
    );
  }
}

class FlightInfo extends StatelessWidget {
  User user;

  FlightInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("UserName", style: big),
            SizedBox(width: 10),
            Text("${user.name},", style: little)
          ],
        ),
        SizedBox(height: 10),
        Row(
//          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Experience",
              style: big,
              maxLines: 1,
            ),
            SizedBox(width: 10),
            Text(
              "${user.experience}, ",
              style: little,
              maxLines: 1,
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("UserName", style: big),
            SizedBox(width: 10),
            Text("${user.name},", style: little)
          ],
        ),
        SizedBox(height: 10),
        Row(
//          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Experience",
              style: big,
              maxLines: 1,
            ),
            SizedBox(width: 10),
            Text(
              "${user.experience}, ",
              style: little,
              maxLines: 1,
            )
          ],
        )
      ],
    );
  }
}