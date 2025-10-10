// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:hungry/core/constants/custom_text.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50).r,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title + Avatar
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SvgPicture.asset('assets/logo/Hungry_ text_black.svg'),
//                     Gap(4.h),
//                     CustomText(
//                       text: 'Hello, Yassine',
//                       color: Colors.black54,
//                       fontSize: 15,
//                     ),
//                   ],
//                 ),
//                 const CircleAvatar(
//                   radius: 22,
//                   backgroundImage: AssetImage('assets/mr_bean.jpeg'),
//                 ),
//               ],
//             ),

//             Gap(30.h),

//             // Search Field
//             Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 4).r,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withValues(alpha: 0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 onTapOutside: (event) => FocusScope.of(context).unfocus(),
//                 decoration: InputDecoration(
//                   icon: Icon(Icons.search, color: Colors.black54),
//                   hintText: 'Search',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),

//             Gap(20.h),

//             // Category Tabs
//             const _CategoryTabs(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CategoryTabs extends StatefulWidget {
//   const _CategoryTabs();

//   @override
//   State<_CategoryTabs> createState() => _CategoryTabsState();
// }

// class _CategoryTabsState extends State<_CategoryTabs> {
//   int selectedIndex = 0;

//   final List<String> categories = [
//     'All',
//     'Combos',
//     'Sliders',
//     'Chicken',
//     'Drinks',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 30.h,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         separatorBuilder: (_, __) => SizedBox(width: 8.w),
//         itemBuilder: (context, index) {
//           final isSelected = index == selectedIndex;
//           return GestureDetector(
//             onTap: () {
//               setState(() => selectedIndex = index);
//             },
//             child: Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 8).r,
//               decoration: BoxDecoration(
//                 color: isSelected ? Colors.green[900] : Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.grey.shade300),
//                 boxShadow:
//                     isSelected
//                         ? [
//                           BoxShadow(
//                             color: Colors.green.withValues(alpha: 0.3),
//                             blurRadius: 6,
//                             offset: const Offset(0, 3),
//                           ),
//                         ]
//                         : [],
//               ),
//               child: Text(
//                 categories[index],
//                 style: TextStyle(
//                   color: isSelected ? Colors.white : Colors.black87,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
