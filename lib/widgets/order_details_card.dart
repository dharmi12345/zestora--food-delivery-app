import 'package:flutter/material.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/burgercombo.png",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange.shade100,
                    child: const Icon(
                      Icons.fastfood,
                      color: Colors.orange,
                      size: 50,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Details",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "1 x Zestora Burger",
                    style: TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "1 x French Fries",
                    style: TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 15),

                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Order Details Clicked")),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(width: 5),

                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Text(
              "₹298",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
