import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryTabs extends StatefulWidget {
  const HomeCategoryTabs({super.key});

  @override
  State<HomeCategoryTabs> createState() => _HomeCategoryTabsState();
}

class _HomeCategoryTabsState extends State<HomeCategoryTabs> {
  int selectedIndex = 0;

  final List<String> categories = [
    'All',
    'Combos',
    'Sliders',
    'Chicken',
    'Drinks',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8).r,
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[900] : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: Colors.green.withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ]
                        : [],
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
