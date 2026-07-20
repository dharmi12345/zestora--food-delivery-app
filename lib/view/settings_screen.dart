import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/edit_profile_screen.dart';
import 'package:zestora_foodapp/view/help_support_screen.dart';
import 'package:zestora_foodapp/view/about_us_screen.dart';
import 'package:zestora_foodapp/view/saved_address_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                title: const Text(
                  "Dharmi Khandhediya",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text("dharmi@gmail.com"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),

            const SizedBox(height: 20),

            settingTile(
              Icons.person_outline,
              "Edit Profile",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
              },
            ),

            settingTile(
              Icons.location_on_outlined,
              "Addresses",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SavedAddressScreen()),
                );
              },
            ),

            Card(
              child: SwitchListTile(
                value: notification,
                activeThumbColor: Colors.orange,
                title: const Text("Notification"),
                secondary: const Icon(Icons.notifications_none),
                onChanged: (value) {
                  setState(() {
                    notification = value;
                  });
                },
              ),
            ),

            settingTile(
              Icons.palette_outlined,
              "Theme",
              trailing: const Text("Light"),
            ),

            settingTile(
              Icons.language,
              "Language",
              trailing: const Text("English"),
            ),

            settingTile(
              Icons.help_outline,
              "Help & Support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpSupportScreen()),
                );
              },
            ),

            settingTile(
              Icons.info_outline,
              "About Us",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                );
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
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

  Widget settingTile(
    IconData icon,
    String title, {
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
