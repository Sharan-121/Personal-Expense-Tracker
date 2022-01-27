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
      child: transList.isEmpty
          ? Column(children: <Widget>[
              Text(
                "No Transactions added yet",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover)),
            ])
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 32,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            '\₹ ${transList[index].cost.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'QuickSand',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transList[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transList[index].date),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'QuickSand',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              itemCount: transList.length,
            ),
    );
  }
}
