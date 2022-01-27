// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/widgets/chart.dart';

import 'package:personal_expense_tracker/widgets/transactions_list.dart';
import 'package:personal_expense_tracker/widgets/transaction_input.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expense Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.teal.shade400),
        fontFamily: "QuickSand",
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                    headline6: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))
                .headline6),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<transaction> _transList = [];

  List<transaction> get _recentTransactions {
    return _transList.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(
      String? title,
      String? amount,
      TextEditingController controller1,
      TextEditingController controller2,
      DateTime? date) {
    var tempTitle;
    var tempAmount;
    var tempDate;
    if ((title != null && title != "") &&
        (amount != null && amount != "") &&
        date != null) {
      tempTitle = title;
      tempAmount = double.parse(amount);
      tempDate = date;
      if (tempAmount > 0) {
        final newTx = transaction(
            id: DateTime.now().toString(),
            title: tempTitle,
            cost: tempAmount,
            date: tempDate);
        setState(() {
          _transList.add(newTx);
          controller1.clear();
          controller2.clear();
          Navigator.of(context).pop();
        });
      }
    }
    return;
  }

  void _deleteTransaction(int index) {
    setState(() {
      _transList.removeAt(index);
    });
  }

  void _startInput(
    BuildContext ctx,
  ) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: ctx,
        builder: (_) {
          return TransInput(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense Tracker'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startInput(context),
            icon: Icon(
              Icons.add_circle,
              size: 27,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Text("Expenses over the last 7 days",
                  style: Theme.of(context).textTheme.headline6),
            ),
            Chart(_recentTransactions),
            TransList(_transList, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startInput(context),
        child: Icon(
          Icons.add,
        ),
      ),
    ));
  }
}
