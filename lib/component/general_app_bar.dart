import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GeneralAppBar extends StatelessWidget {
  final String title;

  const GeneralAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
