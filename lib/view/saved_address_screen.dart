import 'package:flutter/material.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Saved Addresses",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Add Address Clicked")));
        },
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
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
                "12, Krishna Apartment,\nBhavnagar, Gujarat - 364001",
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "Edit", child: Text("Edit")),
                  const PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.work, color: Colors.white),
              ),
              title: const Text(
                "Office",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "IT Department,\nShantilal Shah Engineering College,\nBhavnagar",
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "Edit", child: Text("Edit")),
                  const PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.location_on, color: Colors.white),
              ),
              title: const Text(
                "Other",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Near Railway Station,\nAhmedabad, Gujarat"),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "Edit", child: Text("Edit")),
                  const PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
