class FoodModel {
  final String name;
  final String image;
  final int price;
  final String description;
  final String category;

  FoodModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
  });
}

final List<FoodModel> foodList = [
  // Burgers
  FoodModel(
    name: "Classic Burger",
    image: "assets/images/burger.png",
    price: 199,
    description: "Juicy burger with cheese and fresh vegetables.",
    category: "Burger",
  ),

  // Pizza
  FoodModel(
    name: "Margherita Pizza",
    image: "assets/images/margeritapizza.png",
    price: 299,
    description: "Classic cheese pizza.",
    category: "Pizza",
  ),

  FoodModel(
    name: "Mushroom Pizza",
    image: "assets/images/mushroom_pizza.png",
    price: 349,
    description: "Pizza loaded with mushrooms and cheese.",
    category: "Pizza",
  ),

  // Noodles
  FoodModel(
    name: "Hakka Noodles",
    image: "assets/images/hakka_noodles.png",
    price: 189,
    description: "Chinese style hakka noodles.",
    category: "Noodles",
  ),

  FoodModel(
    name: "Veg Noodles",
    image: "assets/images/Noodles.png",
    price: 179,
    description: "Vegetable noodles.",
    category: "Noodles",
  ),

  // Drinks
  FoodModel(
    name: "Soft Drink",
    image: "assets/images/soft_drinks.png",
    price: 79,
    description: "Refreshing cold drink.",
    category: "Drinks",
  ),

  // Indian Food
  FoodModel(
    name: "Masala Dosa",
    image: "assets/images/masala_dosa.png",
    price: 159,
    description: "South Indian crispy dosa.",
    category: "Indian",
  ),

  FoodModel(
    name: "Idli",
    image: "assets/images/idli.png",
    price: 99,
    description: "Soft idli served with chutney.",
    category: "Indian",
  ),

  FoodModel(
    name: "Pav Bhaji",
    image: "assets/images/pav_bhaji.png",
    price: 169,
    description: "Mumbai style pav bhaji.",
    category: "Indian",
  ),

  FoodModel(
    name: "Paratha",
    image: "assets/images/paratha.png",
    price: 139,
    description: "Stuffed paratha with butter.",
    category: "Indian",
  ),

  FoodModel(
    name: "Chole Bhature",
    image: "assets/images/chole_bhature.png",
    price: 189,
    description: "Punjabi chole bhature.",
    category: "Indian",
  ),

  FoodModel(
    name: "Paneer Butter Masala",
    image: "assets/images/paneer_butter.png",
    price: 249,
    description: "Creamy paneer curry.",
    category: "Indian",
  ),

  // Rice
  FoodModel(
    name: "Veg Biryani",
    image: "assets/images/veg_biryani.png",
    price: 219,
    description: "Aromatic biryani.",
    category: "Rice",
  ),

  FoodModel(
    name: "Fried Rice",
    image: "assets/images/fried_rice.png",
    price: 199,
    description: "Vegetable fried rice.",
    category: "Rice",
  ),

  // Snacks
  FoodModel(
    name: "French Fries",
    image: "assets/images/french_fries.png",
    price: 129,
    description: "Crispy french fries.",
    category: "Snacks",
  ),

  FoodModel(
    name: "Garlic Bread",
    image: "assets/images/garlic_bread.png",
    price: 149,
    description: "Cheesy garlic bread.",
    category: "Snacks",
  ),

  FoodModel(
    name: "Spring Roll",
    image: "assets/images/spring_roll.png",
    price: 159,
    description: "Crispy spring rolls.",
    category: "Snacks",
  ),

  FoodModel(
    name: "Veg Momos",
    image: "assets/images/veg_momos.png",
    price: 149,
    description: "Steamed veg momos.",
    category: "Snacks",
  ),

  FoodModel(
    name: "Veg Wrap",
    image: "assets/images/veg_wrap.png",
    price: 179,
    description: "Healthy vegetable wrap.",
    category: "Snacks",
  ),

  FoodModel(
    name: "Falafel",
    image: "assets/images/falafel.png",
    price: 189,
    description: "Middle Eastern falafel.",
    category: "Snacks",
  ),

  // Chinese
  FoodModel(
    name: "Manchurian",
    image: "assets/images/manchurian.png",
    price: 189,
    description: "Veg Manchurian gravy.",
    category: "Chinese",
  ),

  // Pasta
  FoodModel(
    name: "White Sauce Pasta",
    image: "assets/images/pasta.png",
    price: 229,
    description: "Creamy white sauce pasta.",
    category: "Pasta",
  ),
];

final burgerFoods = foodList
    .where((e) => e.category == "Burger")
    .map(
      (e) => {
        "name": e.name,
        "image": e.image,
        "price": e.price,
        "description": e.description,
      },
    )
    .toList();

final pizzaFoods = foodList
    .where((e) => e.category == "Pizza")
    .map(
      (e) => {
        "name": e.name,
        "image": e.image,
        "price": e.price,
        "description": e.description,
      },
    )
    .toList();

final noodlesFoods = foodList
    .where((e) => e.category == "Noodles")
    .map(
      (e) => {
        "name": e.name,
        "image": e.image,
        "price": e.price,
        "description": e.description,
      },
    )
    .toList();

final drinksFoods = foodList
    .where((e) => e.category == "Drinks")
    .map(
      (e) => {
        "name": e.name,
        "image": e.image,
        "price": e.price,
        "description": e.description,
      },
    )
    .toList();
