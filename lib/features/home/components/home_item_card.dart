import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/custom_text.dart';

class HomeItemCard extends StatelessWidget {
  final String mealImage;
  final String mealType;
  final String mealName;
  const HomeItemCard({
    super.key,
    required this.mealImage,
    required this.mealType,
    required this.mealName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة البرجر
          ClipRRect(
            borderRadius: BorderRadius.circular(12).r,
            child: Image.asset(
              mealImage, // ← ضع مسار الصورة هنا
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
           Gap(10.h),
           CustomText(text: mealName, color: Colors.black,fontFamily: 'PlayfairDisplay',),
          const SizedBox(height: 2),
          Text(
            mealName,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.orange, size: 16),
              SizedBox(width: 4),
              Text(
                "4.8",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
