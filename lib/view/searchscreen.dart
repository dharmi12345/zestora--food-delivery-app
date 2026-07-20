import 'package:flutter/material.dart';
import 'fooddetailscreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Cheese Burger",
      "price": 199,
      "image": "assets/images/burger.png",
      "description":
          "A delicious cheese burger with fresh vegetables and creamy cheese.",
    },
    {
      "name": "Margherita Pizza",
      "price": 299,
      "image": "assets/images/margeritapizza.png",
      "description":
          "Classic Margherita Pizza topped with mozzarella cheese and fresh basil.",
    },
    {
      "name": "Veg Noodles",
      "price": 179,
      "image": "assets/images/Noodles.png",
      "description":
          "Fresh stir-fried noodles with vegetables and delicious sauces.",
    },
    {
      "name": "Paneer Tikka",
      "price": 249,
      "image": "assets/images/paneer_tikka.png",
      "description": "Soft paneer cubes grilled with Indian spices.",
    },
    {
      "name": "Veg Sandwich",
      "price": 149,
      "image": "assets/images/veg_sandwich.png",
      "description": "Fresh vegetable sandwich with cheese and mint chutney.",
    },
    {
      "name": "Veg Momos",
      "price": 169,
      "image": "assets/images/veg_momos.png",
      "description": "Steamed vegetable momos served with spicy chutney.",
    },
    {
      "name": "Masala Dosa",
      "price": 189,
      "image": "assets/images/masala_dosa.png",
      "description": "Crispy dosa stuffed with spicy potato masala.",
    },
    {
      "name": "Pav Bhaji",
      "price": 179,
      "image": "assets/images/pav_bhaji.png",
      "description": "Butter pav served with spicy vegetable bhaji.",
    },
    {
      "name": "Veg Biryani",
      "price": 249,
      "image": "assets/images/veg_biryani.png",
      "description": "Fragrant basmati rice cooked with vegetables and spices.",
    },
    {
      "name": "French Fries",
      "price": 99,
      "image": "assets/images/french_fries.png",
      "description": "Golden crispy potato fries served with tomato ketchup.",
    },
  ];
  List<Map<String, dynamic>> filteredFoods = [];

  @override
  void initState() {
    super.initState();
    filteredFoods = foods;
  }

  void searchFood(String value) {
    setState(() {
      filteredFoods = foods.where((food) {
        return food["name"].toString().toLowerCase().contains(
          value.toLowerCase(),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Search Food", style: TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: searchFood,
              decoration: InputDecoration(
                hintText: "Search your favorite food...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: filteredFoods.isEmpty
                  ? const Center(
                      child: Text(
                        "No Food Found",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredFoods.length,
                      itemBuilder: (context, index) {
                        final food = filteredFoods[index];

                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                food["image"],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.orange.shade100,
                                    child: const Icon(
                                      Icons.fastfood,
                                      color: Colors.orange,
                                    ),
                                  );
                                },
                              ),
                            ),
                            title: Text(
                              food["name"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("₹${food["price"]}"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FoodDetailsScreen(
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
            ),
          ],
        ),
      ),
    );
  }
}
