import 'package:coin/screens/expense_list.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 53, 95, 187));
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 23, 49, 107),
);

void main() {
  runApp(
    MaterialApp(
      // darkTheme: ThemeData.dark()
      //     .copyWith(scaffoldBackgroundColor: kColorScheme.primary),
      // theme: ThemeData().copyWith(
      //   scaffoldBackgroundColor: kColorScheme.primary,
      //   cardTheme: CardTheme(color: kColorScheme.primaryContainer),
      //   dialogTheme: DialogTheme(backgroundColor: kColorScheme.onPrimary),
      //   appBarTheme:
      //       AppBarTheme(backgroundColor: kColorScheme.primaryContainer),
      // ),
      theme: ThemeData(
        colorScheme: kColorScheme,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
      home: const ExpenseList(),
    ),
  );
}
