import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_bloc/utils/styles/app_style.dart';

class TimerInk extends StatelessWidget {
  const TimerInk({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 40.h,
      width: 200.w,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15.r)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.r),
        child: Center(
          child: Text(
            text,
            style: AppStyle.interBold.copyWith(fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
