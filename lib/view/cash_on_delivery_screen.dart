import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/orderconfirmationscreen.dart';
import 'package:zestora_foodapp/data/order_data.dart';

class CashOnDeliveryScreen extends StatelessWidget {
  final double totalAmount;

  const CashOnDeliveryScreen({super.key, required this.totalAmount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Cash on Delivery",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.payments, size: 70, color: Colors.orange),
            ),

            const SizedBox(height: 25),

            const Text(
              "Cash on Delivery",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Pay in cash when your order is delivered.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.orange),
                        SizedBox(width: 10),
                        Text(
                          "Delivery Address",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Khandhediya Dharmi\n"
                        "221, Krishna Apartment\n"
                        "Bhavnagar\n"
                        "Gujarat - 364001",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),

                    const SizedBox(height: 12),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),

                    const Divider(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹${totalAmount.toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  OrderData.currentOrder = OrderData(
                    orderId: "#ZT${DateTime.now().millisecondsSinceEpoch}",
                    customerName: "Khandhediya Dharmi",
                    address:
                        "221, Krishna Apartment, Bhavnagar, Gujarat - 364001",
                    paymentMethod: "Cash on Delivery",
                    totalAmount: totalAmount,
                    orderTime: DateTime.now(),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderConfirmationScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Confirm Order",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
