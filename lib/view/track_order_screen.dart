import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:zestora_foodapp/data/order_data.dart';
import 'package:zestora_foodapp/view/homescreen.dart';
import 'package:zestora_foodapp/view/order_details_screen.dart';

import '../widgets/status_tile.dart';
import '../widgets/delivery_partner_card.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderData? order = OrderData.currentOrder;

    // No order protection
    if (order == null) {
      return Scaffold(
        backgroundColor: const Color(0xffFFF8F2),

        appBar: AppBar(
          backgroundColor: Colors.orange,

          centerTitle: true,

          title: const Text(
            "Track Order",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),

        body: const Center(
          child: Text(
            "No Order Found",

            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    final DateTime orderTime = order.orderTime;

    final DateTime preparingTime = orderTime.add(const Duration(minutes: 5));

    final DateTime outForDeliveryTime = orderTime.add(
      const Duration(minutes: 20),
    );

    final DateTime estimatedDelivery = orderTime.add(
      const Duration(minutes: 35),
    );

    int minutesLeft = estimatedDelivery.difference(DateTime.now()).inMinutes;

    if (minutesLeft < 0) {
      minutesLeft = 0;
    }

    if (minutesLeft > 35) {
      minutesLeft = 35;
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,

        elevation: 0,

        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          order.orderId,

          style: const TextStyle(
            color: Colors.white,

            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Card(
              elevation: 6,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 55,

                      backgroundColor: Colors.orange.shade50,

                      child: Image.asset(
                        "assets/images/deliveryboy.png",

                        height: 90,

                        width: 80,

                        errorBuilder: (context, error, stack) {
                          return const Icon(
                            Icons.delivery_dining,

                            size: 70,

                            color: Colors.orange,
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            order.orderId,

                            style: const TextStyle(
                              fontSize: 24,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Placed on ${DateFormat("dd MMM yyyy, hh:mm a").format(orderTime)}",

                            style: const TextStyle(
                              color: Colors.grey,

                              fontSize: 15,
                            ),
                          ),

                          const Divider(height: 25),

                          const Text(
                            "Estimated Delivery",

                            style: TextStyle(
                              fontSize: 18,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                "$minutesLeft",

                                style: const TextStyle(
                                  fontSize: 45,

                                  color: Colors.orange,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 8),

                              const Text(
                                "Min",

                                style: TextStyle(
                                  fontSize: 25,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,

              child: Text(
                "Order Status",

                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            StatusTile(
              title: "Order Confirmed",

              subtitle: "Your order has been confirmed.",

              time: DateFormat("hh:mm a").format(orderTime),

              completed: true,

              isLast: false,
            ),

            StatusTile(
              title: "Preparing Food",

              subtitle: "Restaurant is preparing your food.",

              time: DateFormat("hh:mm a").format(preparingTime),

              completed: DateTime.now().isAfter(preparingTime),

              isLast: false,
            ),

            StatusTile(
              title: "Out for Delivery",

              subtitle: "Delivery partner is on the way.",

              time: DateFormat("hh:mm a").format(outForDeliveryTime),

              completed: DateTime.now().isAfter(outForDeliveryTime),

              isLast: false,
            ),

            StatusTile(
              title: "Delivered",

              subtitle: "Order delivered successfully.",

              time: DateFormat("hh:mm a").format(estimatedDelivery),

              completed: DateTime.now().isAfter(estimatedDelivery),

              isLast: true,
            ),

            const SizedBox(height: 20),

            const DeliveryPartnerCard(),

            const SizedBox(height: 20),

            Card(
              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: ListTile(
                leading: const Icon(
                  Icons.receipt_long,

                  color: Colors.orange,

                  size: 35,
                ),

                title: const Text(
                  "Order Details",

                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                subtitle: const Text("View ordered items and bill"),

                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) => const OrderDetailsScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              height: 60,

              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                icon: const Icon(Icons.home, color: Colors.white),

                label: const Text(
                  "Back to Home",

                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),

                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,

                    MaterialPageRoute(builder: (_) => const HomeScreen()),

                    (route) => false,
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
