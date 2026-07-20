import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/orderconfirmationscreen.dart';
import 'package:zestora_foodapp/data/order_data.dart';

class UpiPaymentScreen extends StatefulWidget {
  final double totalAmount;

  const UpiPaymentScreen({super.key, required this.totalAmount});
  @override
  State<UpiPaymentScreen> createState() => _UpiPaymentScreenState();
}

class _UpiPaymentScreenState extends State<UpiPaymentScreen> {
  final TextEditingController upiController = TextEditingController();

  String selectedApp = "Google Pay";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "UPI Payment",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange.shade100,
                child: const Icon(
                  Icons.account_balance_wallet,
                  size: 50,
                  color: Colors.orange,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Enter UPI ID",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: upiController,
              decoration: InputDecoration(
                hintText: "example@oksbi",
                prefixIcon: const Icon(Icons.alternate_email),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Choose UPI App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            RadioListTile(
              value: "Google Pay",
              groupValue: selectedApp,
              activeColor: Colors.orange,
              title: const Text("Google Pay"),
              secondary: const Icon(Icons.account_balance_wallet),
              onChanged: (value) {
                setState(() {
                  selectedApp = value!;
                });
              },
            ),

            RadioListTile(
              value: "PhonePe",
              groupValue: selectedApp,
              activeColor: Colors.orange,
              title: const Text("PhonePe"),
              secondary: const Icon(Icons.phone_android),
              onChanged: (value) {
                setState(() {
                  selectedApp = value!;
                });
              },
            ),

            RadioListTile(
              value: "Paytm",
              groupValue: selectedApp,
              activeColor: Colors.orange,
              title: const Text("Paytm"),
              secondary: const Icon(Icons.payment),
              onChanged: (value) {
                setState(() {
                  selectedApp = value!;
                });
              },
            ),

            const SizedBox(height: 25),

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
                      "Amount",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "₹${widget.totalAmount.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (upiController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter UPI ID"),
                        backgroundColor: Colors.red,
                      ),
                    );

                    return;
                  }

                  final order = OrderData(
                    orderId: "#ZT${DateTime.now().millisecondsSinceEpoch}",
                    customerName: "Khandhediya Dharmi",
                    address:
                        "221, Krishna Apartment, Bhavnagar, Gujarat - 364001",
                    paymentMethod: "UPI Payment ($selectedApp)",
                    totalAmount: widget.totalAmount,
                    orderTime: DateTime.now(),
                  );

                  // Save current order for tracking
                  OrderData.currentOrder = order;

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderConfirmationScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Pay Now",
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
