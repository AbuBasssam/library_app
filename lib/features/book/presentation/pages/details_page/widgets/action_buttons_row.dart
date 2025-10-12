import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/spacing.dart';

/// Action buttons row component
class ActionButtonsRow extends StatelessWidget {
  final Widget primaryButton;
  final Widget secondaryButton;
  final double spacing;

  const ActionButtonsRow({
    super.key,
    required this.primaryButton,
    required this.secondaryButton,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: primaryButton),
        horizontalSpace(spacing),
        Expanded(child: secondaryButton),
      ],
    );
  }
}
