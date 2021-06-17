import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/Model/LaunchModel.dart';
import 'package:spacex_latest_launch/Service/ApiService.dart';
import 'package:spacex_latest_launch/View/Widgets/LaunchDetails.dart';
import 'package:spacex_latest_launch/View/Widgets/LoadingWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX Latest Launch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SpaceX Latest Launch'),
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
  bool _loading = true;

  LaunchModel _latestFlight = LaunchModel();

  @override
  void initState() {
    sendRequest();
    super.initState();
  }

  void sendRequest() {
    ApiService.getLatest().then((responseData) {
      setState(() {
        _latestFlight = responseData;
        _loading = false;
      });
    });
  }

  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _loading ? LoadingWidget() : LaunchDetails(_latestFlight),
    );
  }
}
