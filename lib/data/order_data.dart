class OrderData {
  final String orderId;
  final String customerName;
  final String address;
  final String paymentMethod;
  final double totalAmount;
  final DateTime orderTime;

  OrderData({
    required this.orderId,
    required this.customerName,
    required this.address,
    required this.paymentMethod,
    required this.totalAmount,
    required this.orderTime,
  });

  static OrderData? currentOrder;

  // CENTRAL SYSTEM MEMORY FOR ALL ORDERS
  static final List<OrderData> orderHistory = [];
}
