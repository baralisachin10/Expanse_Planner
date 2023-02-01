import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransaction;

  const NewTransaction(this.newTransaction, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = textController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.newTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                  controller: textController,
                  onSubmitted: (_) => submitData(),
                  // onChanged: (value) => titleInput = value,
                  decoration: InputDecoration(labelText: 'Title')),
              TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                  // onChanged: (value) => amountInput = value,
                  decoration: InputDecoration(labelText: 'Amount')),
              TextButton(
                onPressed: submitData,
                child: Text('Add Transaction'),
                // style: TextButton.styleFrom(
                //   textStyle: TextStyle(color: Colors.purple),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                ),
              )
            ],
          ),
        ));
  }
}
