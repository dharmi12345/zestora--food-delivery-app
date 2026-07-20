import 'package:flutter/material.dart';

class AddCouponScreen extends StatefulWidget {
  const AddCouponScreen({super.key});

  @override
  State<AddCouponScreen> createState() => _AddCouponScreenState();
}

class _AddCouponScreenState extends State<AddCouponScreen> {
  final TextEditingController couponController = TextEditingController();

  String message = "";

  void applyCoupon() {
    String coupon = couponController.text.trim().toUpperCase();

    if (coupon == "SAVE100") {
      setState(() {
        message = "🎉 Coupon Applied! ₹100 Discount";
      });
    } else if (coupon == "WELCOME50") {
      setState(() {
        message = "🎉 50% OFF Applied";
      });
    } else if (coupon == "FREEDEL") {
      setState(() {
        message = "🎉 Free Delivery Applied";
      });
    } else if (coupon == "BOGO") {
      setState(() {
        message = "🎉 Buy 1 Get 1 Free Applied";
      });
    } else if (coupon == "UPI20") {
      setState(() {
        message = "🎉 20% Cashback Applied";
      });
    } else {
      setState(() {
        message = "❌ Invalid Coupon Code";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Add Coupon", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Icon(Icons.local_offer, color: Colors.orange, size: 90),

            const SizedBox(height: 20),

            const Text(
              "Enter Coupon Code",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: couponController,
              decoration: InputDecoration(
                hintText: "Enter Coupon Code",
                prefixIcon: const Icon(Icons.discount),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: applyCoupon,
                child: const Text(
                  "Apply Coupon",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: message.contains("Invalid") ? Colors.red : Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
