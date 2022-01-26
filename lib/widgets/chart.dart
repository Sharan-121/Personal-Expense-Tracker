import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days:index),);
      var amount = 0.0;

      for(int i = 0;i<recentTransactions.length;i++){
        if(recentTransactions[i].date.day == weekDay.day &&
        recentTransactions[i].date.month == weekDay.month &&
        recentTransactions[i].date.year == weekDay.year){
          amount+= recentTransactions[i].cost;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': amount.toStringAsFixed(2),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
