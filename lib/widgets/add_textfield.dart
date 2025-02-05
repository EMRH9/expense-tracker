import 'package:flutter/material.dart';

class AddTextfield extends StatelessWidget {
  const AddTextfield({
    required this.keyboardKind,
    required this.textController,
    required this.hintText,
    super.key,
  });
  final String? hintText;
  final textController;
  final TextInputType keyboardKind;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardKind,
      controller: textController,
      decoration: InputDecoration(
        label: Text(hintText.toString()),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
