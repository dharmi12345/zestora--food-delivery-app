import 'package:flutter/material.dart';
import 'fooddetailscreen.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> foods;

  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: foods.isEmpty
          ? const Center(
              child: Text(
                "No food available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: foods.length,

              itemBuilder: (context, index) {
                final food = foods[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),

                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),

                      child: Image.asset(
                        food["image"],
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,

                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.fastfood,
                            size: 50,
                            color: Colors.orange,
                          );
                        },
                      ),
                    ),

                    title: Text(
                      food["name"],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      "₹${food["price"]}",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsScreen(
                            foodName: food["name"],
                            image: food["image"],
                            price: food["price"],
                            description: food["description"],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
