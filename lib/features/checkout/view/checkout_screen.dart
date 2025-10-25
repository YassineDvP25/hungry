import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<CheckoutScreen> {
  String selectedMethod = "cash";
  bool saveCard = true;

  final double order = 16.48;
  final double taxes = 0.3;
  final double delivery = 1.5;

  @override
  Widget build(BuildContext context) {
    final total = order + taxes + delivery;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Payment",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ========== Order Summary ==========
            Text(
              "Order summary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Gap(12.h),
            _summaryRow("Order", "\$${order.toStringAsFixed(2)}"),
            _summaryRow("Taxes", "\$${taxes.toStringAsFixed(1)}"),
            _summaryRow("Delivery fees", "\$${delivery.toStringAsFixed(1)}"),
            Divider(height: 24.h),
            _summaryRow(
              "Total:",
              "\$${total.toStringAsFixed(2)}",
              bold: true,
              color: Colors.black,
            ),
            Gap(4.h),
            Text(
              "Estimated delivery time: 15 - 30 mins",
              style: TextStyle(fontSize: 13.sp, color: Colors.black54),
            ),

            Gap(30.h),

            /// ========== Payment Methods ==========
            Text(
              "Payment methods",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Gap(12.h),

            /// Cash on Delivery Option
            _paymentOption(
              icon: Icons.attach_money,
              color: const Color(0xFF004D25),
              title: "Cash on Delivery",
              value: "cash",
            ),

            Gap(10.h),

            /// Debit Card Option
            _paymentOption(
              imageAsset: "assets/visa_logo.png",
              title: "Debit card",
              subtitle: "3566 **** **** 0505",
              value: "card",
            ),

            Gap(16.h),

            /// Save Card Checkbox
            Row(
              children: [
                Checkbox(
                  value: saveCard,
                  activeColor: const Color(0xFF004D25),
                  onChanged: (v) => setState(() => saveCard = v ?? false),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                Text(
                  "Save card details for future payments",
                  style: TextStyle(fontSize: 13.sp),
                ),
              ],
            ),

            Gap(155.h),

            /// ========== Bottom Total + Pay Now ==========
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total price",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: const Color(0xFF004D25),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Payment confirmed using ${selectedMethod == "cash" ? "Cash on Delivery" : "Debit Card"}",
                          ),
                        ),
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
                      "Pay Now",
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
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    String title,
    String value, {
    bool bold = false,
    Color? color,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 14.sp, color: Colors.black54)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: color ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentOption({
    IconData? icon,
    String? imageAsset,
    required String title,
    String? subtitle,
    required String value,
    Color color = Colors.white,
  }) {
    final isSelected = selectedMethod == value;
    return InkWell(
      onTap: () => setState(() => selectedMethod = value),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2E2E2E) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF004D25) : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child:
                    icon != null
                        ? Icon(icon, color: Colors.white)
                        : Image.asset(
                          imageAsset!,
                          height: 35.h,
                          fit: BoxFit.contain,
                        ),
              ),
            ),
            Gap(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  if (subtitle != null) ...[
                    Gap(4.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: isSelected ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off_outlined,
              color: isSelected ? Colors.white : Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
