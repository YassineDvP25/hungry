import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:hungry/core/constants/custom_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/logo/Hungry_ text_black.svg'),
                    Gap(4.h),
                    CustomText(
                      text: 'Hello, Yassine',
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/mr_bean.jpeg'),
                ),
              ],
            );
  }
}