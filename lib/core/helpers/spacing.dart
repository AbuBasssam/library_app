import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// return a SizedBox with responsive hight
SizedBox verticalSpace(double height) => SizedBox(height: height.h);

/// return a SizedBox with responsive width
SizedBox horizontalSpace(double width) => SizedBox(width: width.w);
