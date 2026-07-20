import 'package:flutter/material.dart';

class RateReviewScreen extends StatefulWidget {
  const RateReviewScreen({super.key});

  @override
  State<RateReviewScreen> createState() => _RateReviewScreenState();
}

class _RateReviewScreenState extends State<RateReviewScreen> {
  int rating = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),

      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Rate & Review",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.orange.shade100,
              child: const Icon(
                Icons.restaurant,
                size: 55,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "How was your order?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Your feedback helps us improve our service.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  icon: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: 40,
                  ),
                );
              }),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your review here...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 35),

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
                  if (rating == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please give a rating")),
                    );
                    return;
                  }

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 70,
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Thank You!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "You rated us $rating ⭐",
                              style: const TextStyle(fontSize: 18),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "Your review has been submitted successfully.",
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 25),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "Submit Review",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
