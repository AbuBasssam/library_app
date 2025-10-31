import 'package:flutter/material.dart';

abstract class BookStateStrategy {
  Widget buildWidget(BuildContext context);
  void onPrimaryAction(BuildContext context);
  void onSecondaryAction(BuildContext context);
}
