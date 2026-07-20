import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/cartdata.dart';
import 'package:zestora_foodapp/view/cartscreen.dart';
import 'package:intl/intl.dart';
import 'package:zestora_foodapp/view/cartitem.dart';
import 'package:zestora_foodapp/data/order_data.dart';

List<OrderData> orderHistory = [];

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Order History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: orderHistory.isEmpty
          ? const Center(
              child: Text(
                "No Orders Yet",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final order = orderHistory[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: OrderCard(
                    image: "assets/images/burger.png",
                    name: "Food Order",
                    quantity: "1 Item",
                    price: "₹${order.totalAmount.toInt()}",
                    date: DateFormat(
                      "dd MMM yyyy, hh:mm a",
                    ).format(order.orderTime),
                    status: "Delivered",
                    statusColor: Colors.green,
                  ),
                );
              },
            ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String image;
  final String name;
  final String quantity;
  final String price;
  final String date;
  final String status;
  final Color statusColor;

  const OrderCard({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 95,
                height: 95,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Container(
                    width: 95,
                    height: 95,
                    color: Colors.orange.shade100,
                    child: const Icon(
                      Icons.fastfood,
                      color: Colors.orange,
                      size: 40,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(quantity, style: const TextStyle(fontSize: 16)),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          date,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                OutlinedButton(
                  onPressed: () {
                    cartItems.add(
                      CartItem(
                        name: name,
                        image: image,
                        price: double.parse(price.replaceAll("₹", "")),
                        quantity: 1,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("$name added to cart"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.orange),
                    foregroundColor: Colors.orange,
                  ),
                  child: const Text("Reorder"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
