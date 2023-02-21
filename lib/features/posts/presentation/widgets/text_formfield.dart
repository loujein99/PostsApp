import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLines;
  final String name;
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.multiLines,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: TextFormField(
          minLines: multiLines ? 6 : 1,
          maxLines: multiLines ? 6 : 1,
          controller: controller,
          validator: (val) => val!.isEmpty ? "$name Can't be empty" : null,
          decoration: InputDecoration(hintText: name),
        ));
  }
}