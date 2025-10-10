import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomAppBar extends StatefulWidget {
  final PageController controller;
  const AppBottomAppBar({super.key, required this.controller});

  @override
  State<AppBottomAppBar> createState() => _AppBottomAppBarState();
}

class _AppBottomAppBarState extends State<AppBottomAppBar> {
  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.local_restaurant_outlined,
    Icons.person_outline,
  ];
    int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.controller.jumpToPage(_selectedIndex);
    // يمكنك التنقل بين الصفحات هنا حسب الفهرس:
    // Navigator.pushNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF004D25), // الأخضر الداكن
      notchMargin: 8,
      elevation: 8,
      child: SizedBox(
        height: 70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _icons[index],
                    color: isSelected ? Colors.white : Colors.white54,
                    size: isSelected ? 28 : 25,
                  ),
                  SizedBox(height: 4.h),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 4.h,
                    width: isSelected ? 20.w : 0,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
