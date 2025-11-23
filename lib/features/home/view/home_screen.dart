import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/models/home_item_card_model.dart';

import 'package:hungry/features/home/components/home_category_tabs.dart';
import 'package:hungry/features/home/components/home_header.dart';
import 'package:hungry/features/home/components/home_item_card.dart';
import 'package:hungry/features/home/components/home_search_field.dart';
import 'package:hungry/features/product/view/product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.h),
            // Title + Avatar
            HomeHeader(),

            Gap(30.h),

            // Search Field
            HomeSearchField(),

            Gap(20.h),

            // Category Tabs
            HomeCategoryTabs(),
            Gap(30.h),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.82,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: HomeItemCardModel.mealsList.length,
                itemBuilder: (context, index) {
                  final meal = HomeItemCardModel.mealsList[index];
                  return HomeItemCard(
                    mealImage: meal.mealImage,
                    mealName: meal.mealName,
                    mealType: meal.mealType,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            mealImage: meal.mealImage,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Home Screen wih Api data 
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';

// import 'package:hungry/features/home/components/home_category_tabs.dart';
// import 'package:hungry/features/home/components/home_header.dart';
// import 'package:hungry/features/home/components/home_item_card.dart';
// import 'package:hungry/features/home/components/home_search_field.dart';
// import 'package:hungry/features/home/cubit/home_cubit.dart';
// import 'package:hungry/features/product/view/product_detail_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit()..fetchProducts(),
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20).r,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Gap(40.h),
//               // Title + Avatar
//               HomeHeader(),

//               Gap(30.h),

//               // Search Field
//               HomeSearchField(),

//               Gap(20.h),

//               // Category Tabs
//               HomeCategoryTabs(),
//               Gap(30.h),

//               Expanded(
//                 child: BlocBuilder<HomeCubit, HomeState>(
//                   builder: (context, state) {
//                     if (state is HomeLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is HomeSuccess) {
//                       final items = state.data;
//                       return GridView.builder(
//                         padding: EdgeInsets.only(bottom: 10),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 0.82,
//                           crossAxisSpacing: 20,
//                           mainAxisSpacing: 20,
//                         ),
//                         itemCount: items!.products.length,
//                         itemBuilder: (context, index) {
//                           final meal = items.products[index];
//                           return HomeItemCard(
//                             mealImage: meal.image,
//                             mealName: meal.name,
//                             mealType: meal.description.substring(0,10),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (context) => ProductDetailScreen(
//                                         mealImage: meal.image,
//                                       ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       );
//                     } else if (state is HomeFailure) {
//                       return Center(child: Text(state.error.toString()));
//                     }
//                     return const SizedBox.shrink();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
