class OrderModel {
  final String orderId;
  final String customerName;
  final String address;
  final String paymentMethod;
  final double total;

  OrderModel({
    required this.orderId,
    required this.customerName,
    required this.address,
    required this.paymentMethod,
    required this.total,
  });
}
