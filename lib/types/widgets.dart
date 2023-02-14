import 'package:flutter/widgets.dart';

abstract class WidgetWithTitle extends StatelessWidget {
  final String title;

  const WidgetWithTitle({super.key, required this.title});
}
