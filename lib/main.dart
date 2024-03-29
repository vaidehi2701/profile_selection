import 'dart:math';
import 'package:profile_selection/data.dart';
import 'Page.dart';
import 'BackgroundGradientWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController primaryController;
  //PageController secondaryController;

  double currentPosition = 0;

  _MyHomePageState() {
    primaryController = PageController(viewportFraction: 0.8);
    //secondaryController = PageController(viewportFraction: 0.8);
    primaryController.addListener(() {
      setState(() {
        currentPosition = primaryController.page;
      });
      //secondaryController.jumpTo(primaryController.position.pixels);
    });
  }
  @override
  Widget build(BuildContext context) {

    List<User> flights = getFlights();

    return Scaffold(
      body: Container(
        child: Stack(children: <Widget>[
          Positioned.fill(child: BackgroundGradientWidget()),
          SafeArea(
            child: Column(
              children: <Widget>[
                Text(
                  "Selected User",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
                Expanded(
                  child: Stack(children: <Widget>[
                    PageView.builder(
                        itemBuilder: (BuildContext c, int i) {
                          User flight = flights[i];
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Opacity(
                                  opacity: 0.5* pow(2, -3*pow(currentPosition - i, 2))+.5,
                                  child: PageWidget(flight, currentPosition - i)),
                            ),
                          );
                        },
                        itemCount: flights.length,
                        controller: primaryController),
                  ]),
                ),
              ],
            ),
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}