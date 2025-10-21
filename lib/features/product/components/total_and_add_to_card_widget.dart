import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/custom_text.dart';

class TotalAddToCartWidget extends StatelessWidget {
  final double total;
  final VoidCallback onAddToCart;

  const TotalAddToCartWidget({
    super.key,
    required this.total,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomText(text:'Total', fontSize: 15.sp, color: Colors.black ),
            Gap(2.h),
            CustomText(
              text: '\$ ${total.toStringAsFixed(2)}',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: onAddToCart,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0D4D28),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: CustomText(
            text: 'Add To Cart',
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: '',
          ),
        ),
      ],
    );
  }
}
