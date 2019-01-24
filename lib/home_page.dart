import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url = "https://jsonplaceholder.typicode.com/posts";
  List data;
  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.indigo,
    Colors.deepPurple,
    Colors.red
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrecsy();
  }

  Future<String> getCurrecsy() async {
    var responce = await http.get(Uri.encodeFull(url));

    setState(() {
      if (responce.statusCode == 200) {
        data = json.decode(responce.body);
      }
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _bitCoinWidget());
  }

  Widget _bitCoinWidget() {
    return Container(
        child: Column(children: <Widget>[
      Flexible(
        child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            //show data from list.
            Map currency = data[index];
            MaterialColor color = _colors[index % _colors.length];
            return getItemUi(currency, color);
          },
        ),
      ),
    ]));
  }

  ListTile getItemUi(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          currency['title'][0],
        ),
      ),
      title: Text(
        currency['title'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(currency['body']),
      isThreeLine: true,
    );
  }
}
