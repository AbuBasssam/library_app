import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/core/theme/app_styles.dart';

class ErrorStateDialog extends StatelessWidget {
  final String error;

  const ErrorStateDialog({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.error, color: Colors.red, size: 32.w),
      content: Text(error, style: AppStyles.font14RichBlackRegular),
      actions: [
        TextButton(
          onPressed: () => GoRouter.of(context).pop(),
          child: Text('Got it', style: AppStyles.font14RichBlackRegular),
        ),
      ],
    );
  }
}
