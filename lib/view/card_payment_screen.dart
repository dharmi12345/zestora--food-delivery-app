import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/orderconfirmationscreen.dart';
import 'package:zestora_foodapp/data/order_data.dart';
// Ensure this path matches the exact name of your screen file
import 'package:zestora_foodapp/view/order_history_screen.dart';
// 1. CRITICAL IMPORT ADDED HERE

class CardPaymentScreen extends StatefulWidget {
  final double totalAmount;

  const CardPaymentScreen({super.key, required this.totalAmount});
  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Card Payment",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange.shade100,
              child: const Icon(
                Icons.credit_card,
                color: Colors.orange,
                size: 50,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Card Number",
                hintText: "1234 5678 9012 3456",
                prefixIcon: const Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: cardHolderController,
              decoration: InputDecoration(
                labelText: "Card Holder Name",
                hintText: "John Doe",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryController,
                    decoration: InputDecoration(
                      labelText: "Expiry",
                      hintText: "MM/YY",
                      prefixIcon: const Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "CVV",
                      hintText: "***",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Amount",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "₹${widget.totalAmount.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // ... inside your Pay Securely button onPressed:
                onPressed: () {
                  if (cardNumberController.text.isEmpty ||
                      cardHolderController.text.isEmpty ||
                      expiryController.text.isEmpty ||
                      cvvController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all details")),
                    );
                    return;
                  }

                  // 1. Create the order object instance
                  OrderData newPlacedOrder = OrderData(
                    orderId:
                        "ZT${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}",
                    customerName: cardHolderController.text.trim(),
                    address:
                        "221, Krishna Apartment, Bhavnagar, Gujarat - 364001",
                    paymentMethod: "Credit / Debit Card",
                    totalAmount: widget.totalAmount,
                    orderTime: DateTime.now(),
                  );

                  // 2. Add to centralized static storage tracker
                  OrderData.orderHistory.add(newPlacedOrder);
                  OrderData.currentOrder = newPlacedOrder;

                  // Navigate to your Confirmation Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderConfirmationScreen(),
                    ),
                  );
                },

                child: const Text(
                  "Pay Securely",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
