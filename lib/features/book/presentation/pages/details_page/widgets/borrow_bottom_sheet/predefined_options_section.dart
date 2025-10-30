import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/features/book/presentation/models/predefined_option.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/predefined_option_card/predefined_option_card.dart';

/// Displays predefined duration options (10, 18, 30 days)
class PredefinedOptionsSection extends StatelessWidget {
  final String sectionTitle;
  final IconData sectionIcon;
  final List<PredefinedOption> options;
  final int? selectedDays;
  final ValueChanged<int> onOptionSelected;

  const PredefinedOptionsSection({
    super.key,
    required this.sectionTitle,
    required this.sectionIcon,
    required this.options,
    required this.selectedDays,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CardTitleRow(
          icon: sectionIcon,
          value: sectionTitle,
          iconColor: AppColors.blue600,
          valueStyle: AppStyles.font15Bold.copyWith(fontSize: 16.sp),
        ),
        verticalSpace(16),
        ...options.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final option = entry.value;

            return TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 300 + (index * 100)),
              tween: Tween(begin: 0.0, end: 1.0),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: PredefinedOptionCard(
                  days: option.days,
                  isRecommended: option.isRecommended,
                  isSelected: selectedDays == option.days,
                  onTap: () => onOptionSelected(option.days),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
