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

  void _addNewTransaction(String? title, String? amount,
      TextEditingController controller1, TextEditingController controller2) {
    var tempTitle;
    var tempAmount;
    if ((title != null && title != "") && (amount != null && amount != "")) {
      tempTitle = title;
      tempAmount = amount;
      final newTx = transaction(
          id: DateTime.now().toString(),
          title: tempTitle,
          cost: double.parse(tempAmount),
          date: DateTime.now());
      setState(() {
        _transList.add(newTx);
        controller1.clear();
        controller2.clear();
      });
    }
    return;
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
