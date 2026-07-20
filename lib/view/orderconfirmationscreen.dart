import 'package:flutter/material.dart';
import 'package:zestora_foodapp/data/order_data.dart';
import 'package:zestora_foodapp/view/homescreen.dart';
import 'package:zestora_foodapp/view/track_order_screen.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrderData.currentOrder;

    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,

        centerTitle: true,

        title: const Text(
          "Order Confirmation",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const CircleAvatar(
                radius: 50,

                backgroundColor: Colors.green,

                child: Icon(Icons.check, size: 60, color: Colors.white),
              ),

              const SizedBox(height: 25),

              const Text(
                "Order Placed Successfully!",

                style: TextStyle(
                  fontSize: 26,

                  fontWeight: FontWeight.bold,

                  color: Colors.orange,
                ),
              ),

              const SizedBox(height: 25),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text(
                            "Order ID",
                            style: TextStyle(fontSize: 18),
                          ),

                          Text(
                            order?.orderId ?? "N/A",

                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text("Amount", style: TextStyle(fontSize: 18)),

                          Text(
                            "₹${order?.totalAmount.toStringAsFixed(0) ?? "0"}",

                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) => const TrackOrderScreen(),
                      ),
                    );
                  },

                  child: const Text(
                    "Track My Order",

                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,

                    MaterialPageRoute(builder: (_) => const HomeScreen()),

                    (route) => false,
                  );
                },

                child: const Text("Back To Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
