import 'package:flutter/material.dart';

class TransInput extends StatefulWidget {
  final Function _addNewTransaction;

  TransInput(this._addNewTransaction);

  @override
  State<TransInput> createState() => _TransInputState();
}

class _TransInputState extends State<TransInput> {
  String? titleInput;

  String? costInput;

  final controller1 = TextEditingController();

  final controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 300,
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
              onEditingComplete: () => widget._addNewTransaction(
                  titleInput, costInput, controller1, controller2),
              onSubmitted: (_) => widget._addNewTransaction(
                  titleInput, costInput, controller1, controller2),
            ),
            TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: controller2,
                onChanged: (value) {
                  costInput = value;
                },
                onEditingComplete: () => widget._addNewTransaction(
                    titleInput, costInput, controller1, controller2),
                onSubmitted: (_) => widget._addNewTransaction(
                    titleInput, costInput, controller1, controller2),
                keyboardType: TextInputType.number),
            ElevatedButton(
              onPressed: () => widget._addNewTransaction(
                  controller1.text, controller2.text, controller1, controller2),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
