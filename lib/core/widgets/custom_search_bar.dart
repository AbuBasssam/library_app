import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/core/helpers/spacing.dart';
import '/core/theme/app_colors.dart';
import '/core/theme/font_weight_helper.dart';
import '/generated/locale_keys.g.dart';

class CustomSearchBar extends StatefulWidget {
  final String? hintTextKey;
  final Function(String)? onSearch;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool enabled;
  final VoidCallback? onTap;

  const CustomSearchBar({
    super.key,
    this.hintTextKey,
    this.onSearch,
    this.onChanged,
    this.controller,
    this.enabled = true,
    this.onTap,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = _controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
    setState(() {
      _showClearButton = false;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () => _focusNode.requestFocus(),
      child: Container(
        height: 42.h,
        width: 361.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(99.r),
          border: Border.all(color: const Color(0xFFE4E7EC), width: 1.w),
        ),
        child: Row(
          children: [
            // Search Icon
            Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20.w,
              color: AppColors.richBlack,
            ),
            horizontalSpace(4),
            // Text Field
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                enabled: widget.enabled,
                onChanged: (value) => widget.onChanged?.call(value),
                onSubmitted: widget.onSearch,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  color: AppColors.richBlack,
                  fontWeight: FontWeightHelper.regular,
                  height: (20 / 12).h,
                ),
                decoration: InputDecoration(
                  hintText:
                      widget.hintTextKey ?? LocaleKeys.search_any_books.tr(),
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.sp,
                    color: AppColors.coolGray,
                    fontWeight: FontWeightHelper.regular,
                    height: 1.2.h,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),

            // Clear Button
            if (_showClearButton)
              GestureDetector(
                onTap: _clearText,
                child: Icon(
                  Icons.close,
                  size: 18.w,
                  color: AppColors.coolGray,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
