import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

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
                  titleInput, costInput, controller1, controller2,_selectedDate),
              onSubmitted: (_) => widget._addNewTransaction(
                  titleInput, costInput, controller1, controller2,_selectedDate),
            ),
            TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: controller2,
                onChanged: (value) {
                  costInput = value;
                },
                onEditingComplete: () => widget._addNewTransaction(
                    titleInput, costInput, controller1, controller2,_selectedDate),
                onSubmitted: (_) => widget._addNewTransaction(
                    titleInput, costInput, controller1, controller2,_selectedDate),
                keyboardType: TextInputType.number),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}'),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  ElevatedButton(
          
                    onPressed: _presentDatePicker,
                    child: Text("Choose Date"),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => widget._addNewTransaction(controller1.text,
                  controller2.text, controller1, controller2, _selectedDate),
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
