import 'package:flutter/material.dart';

import 'loginscreen.dart';
import 'favoritescreen.dart';
import 'my_orders_screen.dart';
import 'saved_address_screen.dart';
import 'order_history_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text("My Profile", style: TextStyle(color: Colors.white)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              "Dharmi Khandhediya",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "dharmi@gmail.com",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 30),

            // My Orders
            buildMenuTile(
              context,
              icon: Icons.shopping_bag,
              title: "My Orders",
              page: const MyOrdersScreen(),
            ),

            // Saved Address
            buildMenuTile(
              context,
              icon: Icons.location_on,
              title: "Saved Address",
              page: const SavedAddressScreen(),
            ),

            // Favorites
            buildMenuTile(
              context,
              icon: Icons.favorite,
              title: "Favorites",
              page: const FavoriteScreen(),
            ),

            // Order History
            buildMenuTile(
              context,
              icon: Icons.receipt_long,
              title: "Order History",
              page: const OrderHistoryScreen(),
            ),

            // Settings
            buildMenuTile(
              context,
              icon: Icons.settings,
              title: "Settings",
              page: const SettingsScreen(),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget page,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}
