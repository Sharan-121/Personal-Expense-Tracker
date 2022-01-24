// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<transaction> transList = [
    transaction(
      id: "t1",
      title: "Shoes",
      cost: 123,
      date: DateTime.now(),
    ),
    transaction(
      id: "t2",
      title: "Grocery",
      cost: 757,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter App'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text(
                    "Chart",
                  ),
                  elevation: 5,
                  color: Colors.amber,
                ),
              ),
              Column(
                children: transList.map((tx) {
                  return Card(
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              tx.cost.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tx.title,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                tx.date.toString(),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ));
                }).toList(),
              ),
            ],
          )),
    );
  }
}