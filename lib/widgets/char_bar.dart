import 'package:coin/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CharBar extends StatelessWidget {
  CharBar({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    final Map<String, double> categoryTotals = {};
    final Map<String, Color> categoryColors = {};

    // Accumulate totals and track colors
    for (final expense in expenses) {
      final categoryKey = expense.category.name.toUpperCase();
      categoryTotals.update(
        categoryKey,
        (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
      categoryColors.putIfAbsent(categoryKey, () => expense.categoryColor);
    }

    final total =
        categoryTotals.values.fold(0.0, (sum, amount) => sum + amount);

    return expenses.isNotEmpty
        ? Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PieChart(
                    // baseChartColor: Colors.blue,
                    chartRadius: 200,

                    dataMap: categoryTotals,
                    // formatChartValues:
                    colorList: categoryTotals.keys
                        .map((key) => categoryColors[key] ?? Colors.grey)
                        .toList(),
                    chartType: ChartType.ring,
                    ringStrokeWidth: 25,
                    centerTextStyle: Theme.of(context).textTheme.titleMedium,
                    centerText: "Total:\n\$${total.toStringAsFixed(2)}",
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false,
                    ),
                    legendOptions: const LegendOptions(
                      showLegends: true,
                      legendPosition: LegendPosition.right,
                    ),
                  ),
                ),
              ),
              Divider(
                height: 25,
              ),
            ],
          )
        : Center(
            child: Text(
              "No Expense!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
  }
}
