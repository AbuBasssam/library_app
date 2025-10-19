import 'package:flutter/material.dart';
import 'check_icon.dart';

class AnimatedSelectedIndicator extends StatelessWidget {
  final bool isSelected;
  const AnimatedSelectedIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: isSelected
          ? CheckIcon()
          : const SizedBox.shrink(key: ValueKey('not_selected')),
    );
  }
}
