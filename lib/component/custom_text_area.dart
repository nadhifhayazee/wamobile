import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String label;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final int maxLines;

  const CustomTextArea({
    required this.label,
    required this.hintText,
    this.onChanged,
    this.initialValue,
    this.maxLines = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            filled: true,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}