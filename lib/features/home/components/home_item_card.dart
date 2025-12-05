import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/custom_text.dart';

class HomeItemCard extends StatelessWidget {
  final String mealImage;
  final String mealType;
  final String mealName;
  final void Function()? onTap;
  const HomeItemCard({
    super.key,
    required this.mealImage,
    required this.mealType,
    required this.mealName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            CustomText(
              text: mealName,
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 2),
            Text(
              mealType,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 3.w),
                    Text(
                      "${mealName.length < 20 ? mealName.length - 10 : mealName.length - 15}.${(mealName.length < 20 ? mealName.length - 10 : mealName.length - 15) - 1}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.favorite,
                  color: const Color.fromARGB(255, 230, 222, 222),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
