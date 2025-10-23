import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/custom_days_input_section/progress_bar.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays custom days input section with slider
class CustomDaysInputSection extends StatefulWidget {
  final int maxDays;
  final ValueChanged<int?> onDaysChanged;

  const CustomDaysInputSection({
    super.key,
    required this.maxDays,
    required this.onDaysChanged,
  });

  @override
  State<CustomDaysInputSection> createState() => _CustomDaysInputSectionState();
}

class _CustomDaysInputSectionState extends State<CustomDaysInputSection>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _controller;
  late final AnimationController _animationController;
  late final Animation<double> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  late int _currentDays;
  late double _percentage;

  @override
  void initState() {
    super.initState();
    _currentDays = 0;
    _percentage = 0;

    _controller = TextEditingController();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 20.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _updateDays(int days) {
    final clampedDays = days.clamp(1, widget.maxDays);
    if (_currentDays != clampedDays) {
      setState(
        () {
          _currentDays = clampedDays;
          _percentage = (_currentDays / widget.maxDays).clamp(0.0, 1.0);

          if (_controller.text != clampedDays.toString()) {
            _controller.text = clampedDays.toString();
          }
        },
      );
      widget.onDaysChanged(clampedDays);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.blue50,
          border: Border.all(color: AppColors.blue200),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleRow(),
            verticalSpace(12),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: LocaleKeys.borrow_enter_number_hint.tr(
                  namedArgs: {'max': widget.maxDays.toString()},
                ),
                filled: true,
                fillColor: Colors.white,
                border: _defaultBorder(),
                enabledBorder: _enableBorder(),
                focusedBorder: _focuseBorder(),
              ),
              onChanged: (value) {
                final days = int.tryParse(value);
                if (days != null) {
                  _updateDays(days);
                  return;
                }
                // Defalut mode
                _currentDays = 0;
                _percentage = 0;
                widget.onDaysChanged(days);
              },
            ),
            verticalSpace(12),
            ProgressBar(percentage: _percentage)
          ],
        ),
      ),
    );
  }

  Row _titleRow() {
    final title = LocaleKeys.borrow_enter_days.tr(
      namedArgs: {'max': widget.maxDays.toString()},
    );
    final titleStyle = AppStyles.font14SemiBold.copyWith(
      color: AppColors.blue800,
    );
    return Row(
      children: [
        _icoEdit(),
        horizontalSpace(6),
        Text(title, style: titleStyle),
      ],
    );
  }

  OutlineInputBorder _defaultBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: AppColors.blue200),
    );
  }

  OutlineInputBorder _focuseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.blue600, width: 2.w),
    );
  }

  OutlineInputBorder _enableBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: AppColors.blue200),
    );
  }

  Icon _icoEdit() {
    return Icon(
      Icons.edit_outlined,
      size: 18.w,
      color: AppColors.blue800,
    );
  }
}
