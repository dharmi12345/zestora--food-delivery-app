import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/deliveryaddressscreen.dart';
import 'cartdata.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double subtotal = 0;

    for (var item in cartItems) {
      subtotal += item.price * item.quantity;
    }

    const double deliveryFee = 40;
    double total = subtotal + deliveryFee;

    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("My Cart", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your Cart is Empty",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item.image,
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 90,
                                      height: 90,
                                      color: Colors.orange.shade100,
                                      child: const Icon(
                                        Icons.fastfood,
                                        color: Colors.orange,
                                        size: 40,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      "₹${item.price.toInt()}",
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (item.quantity > 1) {
                                                item.quantity--;
                                              } else {
                                                cartItems.removeAt(index);
                                              }
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: Colors.orange,
                                          ),
                                        ),

                                        Text(
                                          item.quantity.toString(),
                                          style: const TextStyle(fontSize: 18),
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item.quantity++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    cartItems.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Subtotal",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "₹${subtotal.toInt()}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Fee", style: TextStyle(fontSize: 18)),
                          Text("₹40", style: TextStyle(fontSize: 18)),
                        ],
                      ),

                      const Divider(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹${total.toInt()}",
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

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
                            print("Cart Total = $total");

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    DeliveryAddressScreen(totalAmount: total),
                              ),
                            );
                          },
                          child: const Text(
                            "Proceed to Checkout",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
