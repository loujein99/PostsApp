import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 250.w,
      child: Center(
          child: SingleChildScrollView(
        child: Text(
          message,
          style: TextStyle(fontSize: 25.sp),
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}