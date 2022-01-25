import 'package:flutter/material.dart';

class TransInput extends StatelessWidget {
  String? titleInput;
  String? costInput;
  final Function _addNewTransaction;

  // String checkNull(String? st) {
  //   if (st != null) {
  //     return st;
  //   }
  //   return "0";
  // }

  TransInput(this._addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              onChanged: (value) {
                titleInput = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              onChanged: (value) {
                costInput = value;
              },
            ),
            ElevatedButton(
              onPressed: () => _addNewTransaction(titleInput, costInput),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
