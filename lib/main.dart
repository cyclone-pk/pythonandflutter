import 'package:flutter/material.dart';
import 'API.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url;

  var Data;

  String QueryText = 'Query';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PYTHON AND FLUTTER'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  url = 'http://10.0.2.2:5000/api?Query=' + value.toString();
                },
                decoration: InputDecoration(
                    hintText: 'Search Anything Here',
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          Data = await Getdata(url);
                          var DecodedData = jsonDecode(Data);
                          setState(() {
                            QueryText = DecodedData['Query'];
                          });
                        },
                        child: Icon(Icons.search))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                QueryText,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
