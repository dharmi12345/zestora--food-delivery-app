class Food {
  final String name;
  final String image;
  final double price;
  int quantity;

  Food({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}
