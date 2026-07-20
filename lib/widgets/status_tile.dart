import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool completed;
  final bool isLast;

  const StatusTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.completed,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Timeline
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: completed ? Colors.green : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: completed ? Colors.green : Colors.grey,
                    width: 2,
                  ),
                ),
                child: Icon(
                  completed ? Icons.check : Icons.home,
                  color: completed ? Colors.white : Colors.grey,
                ),
              ),

              if (!isLast)
                Expanded(
                  child: Container(
                    width: 3,
                    color: completed ? Colors.green : Colors.grey.shade300,
                  ),
                ),
            ],
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
