import 'package:flutter/material.dart';
import 'package:zestora_foodapp/data/order_data.dart';
import 'package:zestora_foodapp/view/cartdata.dart';
import 'package:zestora_foodapp/view/homescreen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrderData.currentOrder;

    if (order == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            "Order Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Center(
          child: Text("No Order Found", style: TextStyle(fontSize: 20)),
        ),
      );
    }

    double subtotal = 0;

    for (var item in cartItems) {
      subtotal += item.price * item.quantity;
    }

    const double deliveryFee = 40;
    final total = subtotal + deliveryFee;

    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Order ID",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(order.orderId),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Customer",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(order.customerName),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Address : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Text(order.address)),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Payment",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(order.paymentMethod),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Ordered Items",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Card(
                  child: ListTile(
                    leading: Image.asset(item.image, width: 60, height: 60),

                    title: Text(item.name),

                    subtitle: Text("Qty : ${item.quantity}"),

                    trailing: Text(
                      "₹${(item.price * item.quantity).toInt()}",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal"),
                        Text("₹${subtotal.toInt()}"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Delivery Fee"), Text("₹40")],
                    ),

                    const Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "₹${total.toInt()}",
                          style: const TextStyle(
                            fontSize: 22,
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

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),

                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  );
                },

                child: const Text(
                  "Back to Home",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
