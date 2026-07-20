import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("My Orders", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(15),

        children: [
          orderCard(
            orderId: "#ZST1001",
            food: "Cheese Burger",
            price: "₹199",
            status: "Delivered",
            color: Colors.green,
            date: "10 July 2026",
          ),

          orderCard(
            orderId: "#ZST1002",
            food: "Margherita Pizza",
            price: "₹299",
            status: "Preparing",
            color: Colors.orange,
            date: "12 July 2026",
          ),

          orderCard(
            orderId: "#ZST1003",
            food: "Veg Noodles",
            price: "₹179",
            status: "Cancelled",
            color: Colors.red,
            date: "14 July 2026",
          ),

          orderCard(
            orderId: "#ZST1004",
            food: "Cold Coffee",
            price: "₹149",
            status: "Delivered",
            color: Colors.green,
            date: "15 July 2026",
          ),
        ],
      ),
    );
  }

  Widget orderCard({
    required String orderId,
    required String food,
    required String price,
    required String status,
    required Color color,
    required String date,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderId,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              food,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(
              price,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Order Date : $date",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
