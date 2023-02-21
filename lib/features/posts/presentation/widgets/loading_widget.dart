
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: SizedBox(
          height: 30.h,
          width: 30.w,
          child: const CircularProgressIndicator(
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}