import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum myCategory { work, travel, health, commute, bill }

final dateFormatter = DateFormat.yMd();
const Id = Uuid();

final categoryIcons = {
  myCategory.work: Icons.work,
  myCategory.bill: Icons.edit_document,
  myCategory.commute: Icons.directions_bus_sharp,
  myCategory.health: Icons.health_and_safety,
  myCategory.travel: Icons.flight_takeoff,
};

class Expense {
  String title;
  double amount;
  DateTime date;
  myCategory category;

  Expense(
      {required this.amount,
      required this.title,
      required this.date,
      required this.category});

  String get formattedDate => dateFormatter.format(date);

  static double getCategoryTotal(List<Expense> expenses, myCategory target) {
    return expenses
        .where((e) => e.category == target)
        .fold(0.0, (sum, e) => sum + e.amount);
  }

  static const categoryColors = {
    myCategory.work: Color.fromARGB(150, 244, 67, 54),
    myCategory.travel: Color.fromARGB(150, 63, 81, 181),
    myCategory.commute: Color.fromARGB(150, 33, 149, 243),
    myCategory.health: Color.fromARGB(150, 76, 175, 79),
    myCategory.bill: Color.fromARGB(150, 0, 150, 135),
  };

  IconData? get getIcon => categoryIcons[category];

  Color get categoryColor => categoryColors[category]!;
}
