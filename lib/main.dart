import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coin_flutter/model/koineks.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

Future<List<Koineks>> fetchKoineks() async {
  http.Response result = await http.get('https://koineks.com/ticker');
  Map koineksMap = jsonDecode(result.body);
  List<Koineks> koins = koineksMap.keys
      .map((koin) => Koineks.fromJson(koineksMap[koin]))
      .toList();
  return koins;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<Koineks>>(
          future: fetchKoineks(),
          builder: createListView,
        ),
      ),
    );
  }
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  List<Koineks> values = snapshot.data;
  return ListView.builder(
    itemCount: values.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(values[index].name),
            trailing: Text(values[index].current + " TRY"),
            subtitle: Text(values[index].shortCode),
          ),
          Divider(
            height: 2.0,
          ),
        ],
      );
    },
  );
}
