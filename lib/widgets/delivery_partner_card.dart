import 'package:flutter/material.dart';

class DeliveryPartnerCard extends StatelessWidget {
  const DeliveryPartnerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 42,
              backgroundImage: const AssetImage(
                "assets/images/deliverypartner.png",
              ),
              onBackgroundImageError: (_, _) {},
              child: const Icon(Icons.person, size: 45, color: Colors.orange),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Delivery Partner",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8),

                  Text("Rahul Sharma", style: TextStyle(fontSize: 20)),

                  SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),

                      SizedBox(width: 5),

                      Text("4.8", style: TextStyle(fontSize: 18)),

                      SizedBox(width: 12),

                      Text(
                        "|",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),

                      SizedBox(width: 12),

                      Text("250+ Deliveries", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),

            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.phone, color: Colors.green, size: 32),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Calling Delivery Partner..."),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
