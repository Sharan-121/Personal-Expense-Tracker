import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_input.dart';
import './transactions_list.dart';

class CreateTransaction extends StatefulWidget {
  @override
  _CreateTransactionState createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final List<transaction> _transList = [
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

  void _addNewTransaction(String title, String amount) {
    final newTx = transaction(
        id: DateTime.now().toString(),
        title: title,
        cost: double.parse(amount),
        date: DateTime.now());
    setState(() {
      _transList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransInput(_addNewTransaction),
        TransList(_transList),
      ],
    );
  }
}
