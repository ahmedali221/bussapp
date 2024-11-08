import 'package:bussapp/Models/BusInfo.dart';
import 'package:bussapp/Presentation/BookinPage.dart';
import 'package:flutter/material.dart';

class BusDetailsPage extends StatelessWidget {
  final BusInfo busInfo;
  final List<String> availableFeatures = [
    "WiFi",
    "Port",
    "Meal",
    "small tv",
    "earpods",
    "water bottle"
  ];

  BusDetailsPage({Key? key, required this.busInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
      ),
      body: SingleChildScrollView(
        // Allow scrolling for long content
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              busInfo.companyName,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                const Text('Departure Time:'),
                const SizedBox(width: 10.0),
                Text(busInfo.departureTime),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text('Arrival Time:'),
                const SizedBox(width: 10.0),
                Text(busInfo.arrivalTime),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Text('Price:'),
                const SizedBox(width: 10.0),
                Text(' ${busInfo.price.toString()} EGP'),
              ],
            ),
            const SizedBox(height: 15.0), // Add spacing between sections
            const Text(
              'Features & Amenities:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              // Use Wrap for horizontal arrangement
              spacing: 10.0, // Add spacing between features
              runSpacing: 10.0, // Add spacing between rows
              children: getFeatureChips(availableFeatures.take(5)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod risus eu magna suscipit blandit. Pellentesque elementum libero vitae urna molestie, nec tempor mauris pretium. Cras justo odio, dapibus ac facilisis in, egestas eget quam.', // Replace with actual features
            ),
            // Add a divider (optional)
            const Divider(thickness: 1.0),
            const SizedBox(height: 10.0),
            // Seat map section (optional, implement if offering seat selection)
            const Text(
              'Seat Map:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'This functionality is currently unavailable. Seat selection will be implemented soon.', // Placeholder text
            ),
            // Add a divider (optional)
            const Divider(thickness: 1.0),
            const SizedBox(height: 10.0),
            const Text(
              'Cancellation & Baggage Allowance:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod risus eu magna suscipit blandit. Pellentesque elementum libero vitae urna molestie, nec tempor mauris pretium. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Maecenas sed diam eget risus varius blandit sit amet non magna.', // Replace with actual policies
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ElevatedButton(
          onPressed: () {
            // Implement functionality to proceed with booking (optional)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingPage(
                  busInfo: busInfo,
                  totalSeats: 5,
                ),
              ),
            );
            print('Book Bus: ${busInfo.companyName}');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text('Book Now'),
        ),
      ),
    );
  }

  Widget buildFeatureChip(String feature) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.red,
      ),
      child: Text(
        feature,
        style: const TextStyle(fontSize: 12.0, color: Colors.white),
      ),
    );
  }

  List<Widget> getFeatureChips(Iterable<String> features) {
    return features.map((feature) => buildFeatureChip(feature)).toList();
  }
}
