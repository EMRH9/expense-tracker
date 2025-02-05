import 'package:coin/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:gap/gap.dart';

class ExpenseCard extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense) onTapDismissed;

  const ExpenseCard(
      {super.key, required this.expenses, required this.onTapDismissed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(Id.v4()),
        onDismissed: (direction) => onTapDismissed(expenses[index]),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: expenses[index].categoryColor,
                  child: Icon(expenses[index].getIcon),
                ),
                const Gap(5),
                Text(
                  expenses[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize),
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      "\$${expenses[index].amount}",
                    ),
                    Text(
                      dateFormatter.format(expenses[index].date),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
