import 'package:bussapp/Utils/BusListElement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/BusInfo.dart';

class BusResultsPage extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final DateTime travelDate;
  final int numberOfPeople;

  const BusResultsPage({
    Key? key,
    required this.fromCity,
    required this.toCity,
    required this.travelDate,
    required this.numberOfPeople,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with logic to fetch actual bus data based on received parameters
    final List<BusInfo> availableBuses = [
      BusInfo(
          companyName: "Company A",
          departureTime: '08:00 AM',
          arrivalTime: '02:00 PM',
          price: 500),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company B",
          departureTime: '10:00 AM',
          arrivalTime: '04:00 PM',
          price: 700),
      BusInfo(
          companyName: "Company A",
          departureTime: '08:00 AM',
          arrivalTime: '02:00 PM',
          price: 500),
      BusInfo(
          companyName: "Company A",
          departureTime: '08:00 AM',
          arrivalTime: '02:00 PM',
          price: 500),
      BusInfo(
          companyName: "Company A",
          departureTime: '08:00 AM',
          arrivalTime: '02:00 PM',
          price: 500),
      BusInfo(
          companyName: "Company A",
          departureTime: '08:00 AM',
          arrivalTime: '02:00 PM',
          price: 500),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Results'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Optionally add a header with trip details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the row horizontally
                    crossAxisAlignment: CrossAxisAlignment.center, //
                    children: [
                      Text(
                        fromCity,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.arrow_forward),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        toCity,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Add spacer for better spacing
                  Text(
                    'Number of passengers: $numberOfPeople',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Date: ${DateFormat('EEEE, yyyy-MM-dd').format(travelDate)}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: availableBuses.length,
                itemBuilder: (context, index) {
                  final busInfo = availableBuses[index];
                  return BusListElement(
                    busInfo: busInfo,
                    fromCity: fromCity,
                    toCity: toCity,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ElevatedButton(
          onPressed: () {
            // Implement functionality (optional)
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text('Select Bus'),
        ),
      ),
    );
  }
}
