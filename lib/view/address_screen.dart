import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "My Addresses",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Add Address feature coming soon")),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.home, color: Colors.white),
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "221, Krishna Apartment\nBhavnagar, Gujarat - 364001",
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("$value clicked")));
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.work, color: Colors.white),
              ),
              title: const Text(
                "Office",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Add your office address"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("$value clicked")));
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          Card(
            color: Colors.orange.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.orange),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "You can save multiple delivery addresses for faster checkout.",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
