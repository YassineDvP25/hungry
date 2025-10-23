import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/components/cart_item_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/burger/burger9.png",
      "title": "Hamburger",
      "subtitle": "Veggie Burger",
      "price": 9.29,
      "quantity": 2,
    },
    {
      "image": "assets/burger/burger3.png",
      "title": "Hamburger",
      "subtitle": "Chicken Burger",
      "price": 8.90,
      "quantity": 1,
    },
    {
      "image": "assets/burger/burger3.png",
      "title": "Hamburger",
      "subtitle": "Chicken Burger",
      "price": 8.90,
      "quantity": 1,
    },
    {
      "image": "assets/burger/burger3.png",
      "title": "Hamburger",
      "subtitle": "Chicken Burger",
      "price": 8.90,
      "quantity": 1,
    },
    {
      "image": "assets/burger/burger3.png",
      "title": "Hamburger",
      "subtitle": "Chicken Burger",
      "price": 8.90,
      "quantity": 1,
    },
    {
      "image": "assets/burger/burger3.png",
      "title": "Hamburger",
      "subtitle": "Chicken Burger",
      "price": 8.90,
      "quantity": 1,
    },
    {
      "image": "assets/burger/burger3.png",
      "title": "Hamburger",
      "subtitle": "Chicken Burger",
      "price": 8.90,
      "quantity": 1,
    },
  ];

  double get totalPrice => cartItems.fold(
        0,
        (sum, item) => sum + item["price"] * item["quantity"],
      );

  void removeItem(int index) => setState(() => cartItems.removeAt(index));
  void increment(int index) => setState(() => cartItems[index]["quantity"]++);
  void decrement(int index) => setState(() {
        if (cartItems[index]["quantity"] > 1) cartItems[index]["quantity"]--;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => Gap(12.h),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItemCard(
                    image: item["image"],
                    title: item["title"],
                    subtitle: item["subtitle"],
                    initialQuantity: 
                      item["quantity"],
                    onRemove: () => removeItem(index),
                  onIncrement  : () => increment(index),
                  onDecrement  : () => decrement(index),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Proceeding to Checkout...")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004D25),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                        vertical: 14.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}