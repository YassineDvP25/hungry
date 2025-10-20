import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/product/components/toppings_and_sides_section.dart';
import 'package:hungry/features/product/components/total_and_add_to_card_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double spicyLevel = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.h),

            /// الصورة والنصوص في صف واحد
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// صورة البرجر
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/burger/burger6.png",
                    fit: BoxFit.contain,
                    height: 220,
                  ),
                ),

                const Gap(20),

                /// النصوص
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Customize ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Your Burger\n",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "to Your Tastes. Ultimate\n Experience",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Text(
                        "Spicy",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Icon(
                            Icons.ac_unit,
                            color: Colors.blueAccent,
                            size: 22,
                          ),
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: const Color(0xFF004D25),
                                inactiveTrackColor: Colors.grey[300],
                                thumbColor: Color(0xFF004D25),
                                overlayColor: const Color(
                                  0xFF004D25,
                                ).withValues(alpha: 0.1),
                              ),
                              child: Slider(
                                min: 0,
                                max: 1,
                                value: spicyLevel,
                                onChanged: (value) {
                                  setState(() {
                                    spicyLevel = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.local_fire_department,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          spicyLevel < 0.33
                              ? "Mild 🌿"
                              : spicyLevel < 0.66
                              ? "Medium 🌶"
                              : "Hot 🔥",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color:
                                spicyLevel < 0.33
                                    ? Colors.green
                                    : spicyLevel < 0.66
                                    ? Colors.orange
                                    : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(50.h),
            ToppingsAndSidesSection(),
            Spacer(),
            TotalAddToCartWidget(total: 200, onAddToCart: () {}),
          ],
        ),
      ),
    );
  }
}
