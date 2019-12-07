import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './cards.dart';
import './matches.dart';
import './profiles.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

final MatchEngine matchEngine = new MatchEngine(
    matches: demoProfiles.map((Profile profile) {
  return Match(profile: profile);
}).toList());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent
    ));
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Learn',
      theme: ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
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

  Match match = new Match();
  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    );

  }

  Widget _buildBottomBar() {
    return BottomAppBar(

        color: Colors.transparent,
        elevation: 0.0,
        child: new Padding(
          padding: const EdgeInsets.all(28.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
             RaisedButton(
//                 icon: Icons.keyboard_arrow_left,
//                 iconColor: Colors.red,
                  child:Text("Wet",style: TextStyle(color: Colors.white)
                    ,),
                color: Colors.blue,
                onPressed: () {
                  FlutterTts flutterTts = FlutterTts();
                  counter % 2 == 0 ? flutterTts.speak('wrong') : flutterTts
                      .speak('Correct');
                  counter++;
                  matchEngine.currentMatch.nope();
                },
              ),
             RaisedButton(
                child:Text("Dry",style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                // icon: Icons.keyboard_arrow_right,
                // iconColor: Colors.green,
                onPressed: () {
                  FlutterTts flutterTts = FlutterTts();
                  counter % 2 == 0 ? flutterTts.speak('Correct') : flutterTts.speak('Wrong');
                  counter++;
                  matchEngine.currentMatch.like();
                },
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.speak('Welcome');
    return Scaffold(
      appBar: _buildAppBar(),
      body: new CardStack(
        matchEngine: matchEngine,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 60.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 50.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            new BoxShadow(color: const Color(0x11000000), blurRadius: 10.0),
          ]),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: new Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
