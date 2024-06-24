// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_parking/core/utils/app_colors.dart';

class LineRowSetting extends StatefulWidget {
  final void Function() onTap;
  final IconData icon;
  final String titleRow;
  final bool? isLogout;

  const LineRowSetting({
    super.key,
    required this.onTap,
    required this.icon,
    required this.titleRow,
    this.isLogout,
  });

  @override
  State<LineRowSetting> createState() => _LineRowSettingState();
}

class _LineRowSettingState extends State<LineRowSetting> {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 50,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.isLogout ?? false != false
                    ? AppColors.colorLikeRed
                    : null,
              ),
              SizedBox(width: 10.w),
              Text(
                widget.titleRow,
                style: TextStyle(
                  color: widget.isLogout ?? false != false
                      ? AppColors.colorLikeRed
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
