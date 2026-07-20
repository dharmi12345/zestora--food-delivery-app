import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/cartscreen.dart';
import 'cartdata.dart';
import 'cartitem.dart';

class FoodDetailsScreen extends StatefulWidget {
  final String foodName;
  final String image;
  final int price;
  final String description;

  const FoodDetailsScreen({
    super.key,
    required this.foodName,
    required this.image,
    required this.price,
    required this.description,
  });

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.foodName,
          style: const TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.image,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 280,
                  color: Colors.orange.shade100,
                  child: const Center(
                    child: Icon(Icons.fastfood, size: 80, color: Colors.orange),
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text("4.8"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "₹${widget.price * quantity}",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.grey, height: 1.5),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Quantity",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.orange,
                          size: 35,
                        ),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),

                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.orange,
                          size: 35,
                        ),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        bool found = false;

                        for (var item in cartItems) {
                          if (item.name == widget.foodName) {
                            item.quantity += quantity;
                            found = true;
                            break;
                          }
                        }

                        if (!found) {
                          cartItems.add(
                            CartItem(
                              name: widget.foodName,
                              image: widget.image,
                              price: widget.price.toDouble(),
                              quantity: quantity,
                            ),
                          );
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${widget.foodName} Added to Cart"),
                            duration: const Duration(seconds: 1),
                          ),
                        );

                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CartScreen(),
                            ),
                          );
                        });
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
