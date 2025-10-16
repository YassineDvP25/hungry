import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/models/home_item_card_model.dart';
import 'package:hungry/features/home/components/home_category_tabs.dart';
import 'package:hungry/features/home/components/home_header.dart';
import 'package:hungry/features/home/components/home_item_card.dart';
import 'package:hungry/features/home/components/home_search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
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
            const HomeCategoryTabs(),
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
                    onTap: (){},
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
