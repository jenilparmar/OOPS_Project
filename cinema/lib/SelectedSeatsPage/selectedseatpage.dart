import 'package:cinema/QR_CODE/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SelectedSeatsPage extends StatelessWidget {
  final List<String> selectedSeats;
  final List<int> seatPrize;
  final String upiId = 'jenilparmar94091@okaxis'; // Your UPI ID
  final String userName = 'Jenil'; // Your name/business name

  const SelectedSeatsPage({
    super.key,
    required this.selectedSeats,
    required this.seatPrize,
  });

  @override
  Widget build(BuildContext context) {
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
                      "₹${seatPrize[index]}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Your total fair is ₹${totalCost}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to QR code page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRCodePage(
                        upiId: upiId,
                        userName: userName,
                        totalCost: totalCost,
                      ),
                    ),
                  );
                },
                child: Text('Pay ₹${totalCost}'),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
