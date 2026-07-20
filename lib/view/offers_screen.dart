import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/add_coupon_screen.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Offers & Coupons",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          offerCard(
            context: context,
            title: "Flat ₹100 OFF",
            subtitle: "On orders above ₹499",
            code: "SAVE100",
            color: Colors.orange,
          ),

          offerCard(
            context: context,
            title: "50% OFF",
            subtitle: "Up to ₹150 on your first order",
            code: "WELCOME50",
            color: Colors.red,
          ),

          offerCard(
            context: context,
            title: "Free Delivery",
            subtitle: "No delivery charge on orders above ₹299",
            code: "FREEDEL",
            color: Colors.green,
          ),

          offerCard(
            context: context,
            title: "Buy 1 Get 1 Free",
            subtitle: "Applicable on selected pizzas",
            code: "BOGO",
            color: Colors.deepPurple,
          ),

          offerCard(
            context: context,
            title: "20% Cashback",
            subtitle: "Pay using UPI",
            code: "UPI20",
            color: Colors.blue,
          ),

          offerCard(
            context: context,
            title: "₹75 OFF",
            subtitle: "On Burger Orders",
            code: "BURGER75",
            color: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget offerCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String code,
    required Color color,
  }) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: color.withValues(alpha: 0.08),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    child: const Icon(Icons.local_offer, color: Colors.white),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(subtitle, style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  code,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddCouponScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Apply Coupon",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
