import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/cartdata.dart';
import 'package:zestora_foodapp/view/cartscreen.dart';
import 'package:intl/intl.dart';
import 'package:zestora_foodapp/view/cartitem.dart';
import 'package:zestora_foodapp/data/order_data.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // Reads directly from the global state reference on build execution
    final currentHistory = OrderData.orderHistory;

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
      body: currentHistory.isEmpty
          ? const Center(
              child: Text(
                "No Orders Yet",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: currentHistory.length,
              // Displays the most recent order at the top of the list
              itemBuilder: (context, index) {
                final order = currentHistory[currentHistory.length - 1 - index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: OrderCard(
                    image: "assets/images/burger.png",
                    name: "ID: ${order.orderId}",
                    quantity: "Paid via ${order.paymentMethod}",
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    quantity,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
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
                    color: statusColor.withOpacity(0.15),
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
                const SizedBox(height: 15),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    cartItems.add(
                      CartItem(
                        name: "Food Item",
                        image: image,
                        price: double.parse(price.replaceAll("₹", "")),
                        quantity: 1,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Item added back to cart"),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                  ),
                  child: const Text("Reorder", style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
