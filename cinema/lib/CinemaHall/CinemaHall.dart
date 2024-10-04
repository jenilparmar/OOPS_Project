import 'package:flutter/material.dart';

class Cinemahall extends StatefulWidget {
  final int Platinum;
  final int Gold;
  final int Silver;

  const Cinemahall({
    super.key,
    required this.Platinum,
    required this.Gold,
    required this.Silver,
  });

  @override
  State<StatefulWidget> createState() {
    return _CinemahallState();
  }
}

class _CinemahallState extends State<Cinemahall> {
 
  List<Widget> generateSeats(int seatCount, Color color, String seatPrefix) {
    int seatsPerRow = 4;
    return List<Widget>.generate(seatCount, (index) {
     
      String rowLetter = String.fromCharCode(
          65 + (index ~/ seatsPerRow));
     
      int seatNumber = (index % seatsPerRow) + 1;
     
      String seatLabel = "$rowLetter$seatPrefix$seatNumber";

      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding:
                  const EdgeInsets.all(4.0), 
              child: Icon(
                Icons.event_seat,
                color: color,
                size: 40,
              ),
            ),
            const SizedBox(
                height: 3.4),
            Text(
              seatLabel,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/image.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
         
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      'Platinum Seats',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount:
                      4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap:
                      true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  children: generateSeats(widget.Platinum,
                      const Color.fromARGB(255, 13, 31, 226), 'P'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Gold Seats',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: generateSeats(widget.Gold, Colors.amber, 'G'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Silver Seats',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: generateSeats(widget.Silver, Colors.grey, 'S'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
