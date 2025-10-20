import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ToppingsAndSidesSection extends StatefulWidget {
  const ToppingsAndSidesSection({super.key});

  @override
  State<ToppingsAndSidesSection> createState() =>
      _ToppingsAndSidesSectionState();
}

class _ToppingsAndSidesSectionState extends State<ToppingsAndSidesSection> {
  final List<Map<String, dynamic>> toppings = [
    {"name": "Tomato", "image": "assets/toppings/tomato.png", "selected": false},
    {"name": "Onions", "image": "assets/toppings/onion.png", "selected": false},
    {
      "name": "Pickles",
      "image": "assets/toppings/pickles.png",
      "selected": false,
    },
    {"name": "Bacons", "image": "assets/toppings/bacons.png", "selected": false},
  ];

  final List<Map<String, dynamic>> sides = [
    {"name": "Fries", "image": "assets/toppings/fries.png", "selected": false},
    {
      "name": "Coleslaw",
      "image": "assets/toppings/coleslaw.png",
      "selected": false,
    },
    {"name": "Salad", "image": "assets/toppings/salad.png", "selected": false},
    {"name": "sausage", "image": "assets/toppings/sausage.png", "selected": false},
  ];

  void toggleSelection(List<Map<String, dynamic>> list, int index) {
    setState(() {
      list[index]["selected"] = !list[index]["selected"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(24.h),
        Text(
          "Toppings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        Gap(12.h),
        SizedBox(
          height: 80.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: toppings.length,
            separatorBuilder: (_, __) => Gap(18.w),
            itemBuilder: (context, index) {
              final topping = toppings[index];
              return _buildOptionCard(
                name: topping["name"],
                image: topping["image"],
                selected: topping["selected"],
                onTap: () => toggleSelection(toppings, index),
              );
            },
          ),
        ),
        Gap(30.h),
        Text(
          "Side options",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        Gap(12.h),
        SizedBox(
          height: 80.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sides.length,
            separatorBuilder: (_, __) => Gap(18.w),
            itemBuilder: (context, index) {
              final side = sides[index];
              return _buildOptionCard(
                name: side["name"],
                image: side["image"],
                selected: side["selected"],
                onTap: () => toggleSelection(sides, index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard({
    required String name,
    required String image,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 70.w,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r),
                    bottomLeft: Radius.circular(18.r),
                    bottomRight: Radius.circular(18.r),
                  ),
                ),
                child: Center(
                  child: Image.asset(image, height: 45.h, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 6.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: 15.w,
                      height: 15.w,
                      decoration: BoxDecoration(
                        color: selected ? Colors.red : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        selected ? Icons.remove : Icons.add,
                        color: selected
                            ? Colors.white
                            : const Color(0xFF3E2723),
                        size: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
