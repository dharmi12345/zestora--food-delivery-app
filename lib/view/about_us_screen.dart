import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "About Us",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.orange.shade100,
              child: const Icon(Icons.fastfood, size: 60, color: Colors.orange),
            ),

            const SizedBox(height: 15),

            const Text(
              "Zestora",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  "Zestora is a modern online food delivery application designed to provide a fast, secure, and convenient food ordering experience. Users can explore restaurants, browse menus, place orders, track deliveries in real time, and enjoy delicious meals delivered directly to their doorstep.",
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.privacy_tip, color: Colors.orange),
                title: const Text("Privacy Policy"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Privacy Policy coming soon."),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.description, color: Colors.orange),
                title: const Text("Terms & Conditions"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Terms & Conditions coming soon."),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: const ListTile(
                leading: Icon(Icons.email, color: Colors.orange),
                title: Text("Contact Email"),
                subtitle: Text("support@zestora.com"),
              ),
            ),

            Card(
              child: const ListTile(
                leading: Icon(Icons.phone, color: Colors.orange),
                title: Text("Customer Support"),
                subtitle: Text("+91 98765 43210"),
              ),
            ),

            const SizedBox(height: 25),

            const Divider(),

            const SizedBox(height: 10),

            const Text(
              "Developed By",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text("Dharmi Khandhediya", style: TextStyle(fontSize: 16)),

            const SizedBox(height: 5),

            const Text(
              "Information Technology Student",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            const Text(
              "© 2026 Zestora. All Rights Reserved.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
