import 'package:flutter/material.dart';

class SelectedSeatsPage extends StatelessWidget {
  final List<String> selectedSeats;
  final List<int> seatPrize;

  const SelectedSeatsPage({
    super.key,
    required this.selectedSeats,
    required this.seatPrize,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate total cost of selected seats
    int totalCost = seatPrize.reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Seats Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selected Seats:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedSeats.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.event_seat),
                    title: Text(
                      selectedSeats[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: Text(
                      "\$${seatPrize[index]}", // Display the seat price
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Display the total cost at the bottom
            Center(
              child: Text(
                "Total Cost: \$${totalCost}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
