import 'package:flutter/material.dart';

class TransInput extends StatelessWidget {
  String? titleInput;
  String? costInput;
  final Function _addNewTransaction;
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

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
              controller: controller1,
              decoration: InputDecoration(labelText: "Title"),
              onChanged: (value) {
                titleInput = value;
              },
              onSubmitted: (_) => _addNewTransaction(titleInput, costInput),
            ),
            TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: controller2,
                onChanged: (value) {
                  costInput = value;
                },
                onSubmitted: (_) => _addNewTransaction(titleInput, costInput),
                keyboardType: TextInputType.number),
            ElevatedButton(
              onPressed: () => _addNewTransaction(
                  controller1.text, controller2.text, controller1, controller2),
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
