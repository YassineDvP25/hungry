import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004D25),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ===== Avatar =====
            Center(
              child: Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 3.w),
                  image: const DecorationImage(
                    image: AssetImage("assets/mr_bean.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Gap(40.h),

            /// ===== Name =====
            _buildProfileField(label: "Name", value: "Yassine"),
            Gap(16.h),

            /// ===== Email =====
            _buildProfileField(label: "Email", value: "yassine00@gmail.com"),
            Gap(16.h),

            /// ===== Address =====
            _buildProfileField(label: "Delivery address", value: "55 Erra, Mar"),
            Gap(16.h),

            /// ===== Password =====
            _buildProfileField(
              label: "Password",
              value: "********",
              icon: Icons.lock_outline,
            ),
            Gap(16.h),

            Divider(color: Colors.white.withValues( alpha : 0.3)),
            Gap(20.h),

            /// ===== Payment Card =====
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/visa_logo.png",
                    height: 28.h,
                  ),
                  Gap(12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Debit card",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "3566 **** **** 0505",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.radio_button_checked,
                      color: const Color(0xFF004D25), size: 22.sp),
                ],
              ),
            ),

            Gap(40.h),

            /// ===== Buttons =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Edit Profile
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(8.w),
                        Icon(Icons.edit_outlined,
                            color: Colors.black, size: 18.sp),
                      ],
                    ),
                  ),
                ),

                Gap(16.w),

                /// Log Out
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log out",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(8.w),
                        Icon(Icons.logout, color: Colors.white, size: 18.sp),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ===== Helper Widget =====
  Widget _buildProfileField({
    required String label,
    required String value,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Gap(6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white70, width: 1.2.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 18.sp,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
