import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class TransList extends StatelessWidget {
  late List<transaction> transList;

  TransList(this.transList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '\₹ ${transList[index].cost.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transList[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        DateFormat.yMMMd().format(transList[index].date),
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ],
                  )
                ],
              ));
        },
        itemCount: transList.length,
      ),
    );
  }
}
