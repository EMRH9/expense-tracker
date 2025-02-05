import 'package:coin/models/expense.dart';
import 'package:coin/widgets/char_bar.dart';
import 'package:coin/widgets/expense_card.dart';
import 'package:coin/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  // List<Expense> newExpense;

  const ExpenseList({super.key});
  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  final List<Expense> _expense = [
    Expense(
        amount: 120,
        title: "New Shoes",
        date: DateTime.now(),
        category: myCategory.work),
    Expense(
        amount: 100,
        title: "New Shoes",
        date: DateTime.now(),
        category: myCategory.travel),
    Expense(
        amount: 100,
        title: "New Shoes",
        date: DateTime.now(),
        category: myCategory.bill),
    Expense(
        amount: 100,
        title: "New Shoes",
        date: DateTime.now(),
        category: myCategory.health),
  ];

  _removeExpense(Expense expense) {
    var itemIndex = _expense.indexOf(expense);
    var item = expense;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 600),
        content: const Text("Deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _expense.insert(itemIndex, item);
            });
          },
        ),
      ),
    );
    setState(
      () {
        // _expense.insert(_expense.indexOf(expense), expense);
        _expense.removeAt(
          _expense.indexOf(expense),
        );
        print(expense.amount);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 53, 95, 187),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) => NewExpense(
              onAdd: (expense) {
                setState(() {
                  _expense.add(expense);
                });
              },
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text(
          "Expenses",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 57, 124, 250).withOpacity(0.90),
                const Color.fromARGB(255, 53, 95, 187),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CharBar(
              expenses: _expense,
            ),
            Expanded(
              child: ExpenseCard(
                expenses: _expense,
                onTapDismissed: _removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
