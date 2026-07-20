import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Help & Support",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Card(
              child: ExpansionTile(
                leading: const Icon(Icons.help_outline, color: Colors.orange),
                title: const Text("How can I track my order?"),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Go to 'My Orders' and tap on 'Track Order' to view the live status of your order.",
                    ),
                  ),
                ],
              ),
            ),

            Card(
              child: ExpansionTile(
                leading: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.orange,
                ),
                title: const Text("How can I cancel my order?"),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "You can cancel your order before the restaurant starts preparing it.",
                    ),
                  ),
                ],
              ),
            ),

            Card(
              child: ExpansionTile(
                leading: const Icon(Icons.payment, color: Colors.orange),
                title: const Text("Which payment methods are supported?"),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "We support UPI, Credit/Debit Cards, and Cash on Delivery.",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Contact Support",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.phone, color: Colors.white),
                ),
                title: const Text("Call Us"),
                subtitle: const Text("+91 98765 43210"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Calling support...")),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.email, color: Colors.white),
                ),
                title: const Text("Email Us"),
                subtitle: const Text("support@zestora.com"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Opening email...")),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.chat, color: Colors.white),
                ),
                title: const Text("Live Chat"),
                subtitle: const Text("Available 24×7"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Starting chat...")),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Thank you for your feedback!"),
                    ),
                  );
                },
                icon: const Icon(Icons.feedback, color: Colors.white),
                label: const Text(
                  "Send Feedback",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
