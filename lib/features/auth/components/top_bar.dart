
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/custom_text.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String subtitle;
  const TopBar({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // verticalSpace(16),
        SizedBox(width: double.infinity,),
      
        // verticalSpace(24),
      CustomText(text: title , fontSize: 28, fontWeight: FontWeight.w800),
        Gap(8),
        Text(
          subtitle,
          textAlign: TextAlign.right,
          style:  TextStyle(color: Colors.white70, fontSize: 12.sp),
        ),
        Gap(24),
      ],
    );
  }
}