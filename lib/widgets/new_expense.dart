import 'package:coin/models/expense.dart';
import 'package:coin/widgets/add_textfield.dart';
import 'package:flutter/material.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:gap/gap.dart';

class NewExpense extends StatefulWidget {
  void Function(Expense expense) onAdd;
  NewExpense({required this.onAdd, super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DateTime _date = DateTime.now();
  myCategory? _categoryValue;

  _submiteForm() {
    if (_categoryValue == null ||
        titleController.text.isEmpty ||
        amountController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Some or one of the inputs are empty!'),
          title: const Text("Invalid Input"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Ok"),
            ),
          ],
        ),
      );
    } else {
      widget.onAdd(
        Expense(
          amount: double.parse(amountController.text),
          title: titleController.text,
          date: _date!,
          category: _categoryValue!,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Column(
        children: [
          Text(
            "Add Expense",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.displaySmall!.fontSize),
          ),
          const Gap(10),
          AddTextfield(
            keyboardKind: TextInputType.number,
            hintText: "Amount",
            textController: amountController,
          ),
          const Gap(10),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              suffixIcon: DropdownButton(
                iconSize: 40,
                padding: const EdgeInsets.only(right: 5),
                items: myCategory.values
                    .map(
                      (category) => DropdownMenuItem(
                        onTap: () {
                          _categoryValue = category;
                        },
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) => _categoryValue = value!,
              ),
              label: const Text("Title & Category"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const Gap(10),
          DateFormatField(
            decoration: InputDecoration(
              label: const Text("Date"),
              focusColor: Theme.of(context).focusColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onComplete: (date) {
              _date = date!;
              print(_date.toString());
            },
            type: DateFormatType.type1,
          ),
          const Gap(10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).buttonTheme.colorScheme!.primary,
                    foregroundColor:
                        Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: _submiteForm,
                  child: const Text("Add"),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: const BeveledRectangleBorder(),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
