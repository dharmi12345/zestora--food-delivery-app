import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/homescreen.dart';
import 'package:zestora_foodapp/view/signupscreen.dart';

void main() {
  runApp(const ZestoraApp());
}

class ZestoraApp extends StatelessWidget {
  const ZestoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zestora',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter email"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    if (!email.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter valid email"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter password"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be minimum 6 characters"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [
              const SizedBox(height: 30),

              CircleAvatar(
                radius: 50,

                backgroundColor: Colors.orange.shade100,

                child: const Icon(
                  Icons.fastfood,
                  size: 60,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Zestora",

                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Delicious food delivered to your doorstep",

                textAlign: TextAlign.center,

                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  hintText: "Email",

                  prefixIcon: const Icon(Icons.email),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,

                obscureText: true,

                decoration: InputDecoration(
                  hintText: "Password",

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: const Icon(Icons.visibility_off),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () {},

                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,

                height: 55,

                child: ElevatedButton(
                  onPressed: login,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    "Login",

                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,

                height: 55,

                child: OutlinedButton.icon(
                  onPressed: () {
                    // Google login validation can be added later

                    Navigator.pushReplacement(
                      context,

                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },

                  icon: const Icon(
                    Icons.g_mobiledata,
                    size: 35,
                    color: Colors.red,
                  ),

                  label: const Text(
                    "Continue with Google",

                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),

                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("Don't have an account? "),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },

                    child: const Text(
                      "Sign Up",

                      style: TextStyle(
                        color: Colors.orange,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
