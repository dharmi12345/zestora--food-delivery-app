import 'package:flutter/material.dart';
import 'package:zestora_foodapp/view/cartscreen.dart';
import 'package:zestora_foodapp/view/favoritescreen.dart';
import 'package:zestora_foodapp/view/fooddetailscreen.dart';
import 'package:zestora_foodapp/view/offers_screen.dart';
import 'package:zestora_foodapp/view/order_history_screen.dart';
import 'package:zestora_foodapp/view/profilescreen.dart';
import 'package:zestora_foodapp/view/searchscreen.dart';
import '../data/food_data.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FavoriteScreen()),
        );
        break;

      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CartScreen()),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const OrderHistoryScreen()),
        );
        break;

      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          "Zestora",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello 👋",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 5),

            const Text(
              "What would you like to eat today?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()),
                );
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search food...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.local_offer, color: Colors.white),
                label: const Text(
                  "Offers & Coupons",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OffersScreen()),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryCard(
                  icon: Icons.fastfood,
                  title: "Burger",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          categoryName: "Burger",
                          foods: burgerFoods,
                        ),
                      ),
                    );
                  },
                ),

                CategoryCard(
                  icon: Icons.local_pizza,
                  title: "Pizza",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          categoryName: "Pizza",
                          foods: pizzaFoods,
                        ),
                      ),
                    );
                  },
                ),
                CategoryCard(
                  icon: Icons.ramen_dining,
                  title: "Noodles",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          categoryName: "Noodles",
                          foods: noodlesFoods,
                        ),
                      ),
                    );
                  },
                ),

                CategoryCard(
                  icon: Icons.local_drink,
                  title: "Drinks",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          categoryName: "Drinks",
                          foods: drinksFoods,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Popular Foods",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // Popular Food List
            ...foodList.map(
              (food) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: FoodCard(
                  name: food.name,
                  price: "₹${food.price}",
                  image: food.image,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FoodDetailsScreen(
                          foodName: food.name,
                          image: food.image,
                          price: food.price,
                          description: food.description,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Orders",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.orange, size: 30),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final VoidCallback onTap;

  const FoodCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 70,
                      height: 70,
                      color: Colors.orange.shade100,
                      child: const Icon(
                        Icons.fastfood,
                        color: Colors.orange,
                        size: 35,
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
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              CircleAvatar(
                backgroundColor: Colors.orange,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
