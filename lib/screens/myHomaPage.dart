import 'package:flutter/material.dart';
import '../widgets/chart.dart';
import '../widgets/new_transactions.dart';
import '../widgets/transactions_list.dart';
import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final List<Transaction> _userTransaction = [];

  List<Transaction> get _recentTransactions {
    return _userTransaction.takeWhile((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  bool _showChart = false;

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text("Personal Expenses"),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add))
      ],
    );

    final textListWidget = SizedBox(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(_userTransaction, _deleteTransaction));

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isLandScape)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Show Chart',
                      style: Theme.of(context).textTheme.titleLarge),
                  Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ]),
              if (!isLandScape)
                SizedBox(
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.3,
                    child: Chart(_recentTransactions)),
              if (!isLandScape) textListWidget,
              if (isLandScape)
                _showChart
                    ? SizedBox(
                        height: (mediaQuery.size.height -
                                appBar.preferredSize.height -
                                mediaQuery.padding.top) *
                            0.7,
                        child: Chart(_recentTransactions))
                    : textListWidget,
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: const Icon(Icons.add)),
    );
  }
}
