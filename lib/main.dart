import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'package:my_veggielist_app/http/network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.placeData}) : super(key: key);

  final String title;
  final dynamic placeData;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title;
  void main() {
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    //  var url = Uri.parse('https://tebackend.herokuapp.com/api/places');
    NetWork network = NetWork();
    var placeData = await network.getJson();
    //  print(placeData);
  }

/*
  void fetchData() async {
    var url = Uri.parse('https://tebackend.herokuapp.com/api/places');
    // Response response = await get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData)['places'];
      var myJson = parsingData[0]['title'];
      print(myJson);
      var title = parsingData[1];
      print(title);
    } else {
      print(response.statusCode);
    }
    // print(response.statusCode);
    // print(response.body);
  }
*/
  @override
  Widget build(BuildContext context) {
    void updateData(dynamic data) {
      var description = data['description'];
      print(description);
    }

    @override
    void initState() {
      super.initState();
      //print(widget.placeData);
      updateData(widget.placeData);
      // print(widget.placeData);
    }

    var description;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$description',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '1234656',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
