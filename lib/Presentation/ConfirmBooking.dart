import 'package:flutter/material.dart';

import '../Models/BusInfo.dart';

class ConfirmationPage extends StatelessWidget {
  final BusInfo busInfo;
  final int totalSeats;
  final String passengerName;
  final String passengerEmail;
  final String passengerPhone;

  const ConfirmationPage({
    Key? key,
    required this.busInfo,
    required this.totalSeats,
    required this.passengerName,
    required this.passengerEmail,
    required this.passengerPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int totalPrice = totalSeats * busInfo.price;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
      ),
      body: SingleChildScrollView(
        // Allow scrolling if content overflows
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
          children: [
            const Text(
              'Booking Confirmation',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bus Information:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '${busInfo.companyName} ',
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                        'Time: ${busInfo.departureTime} to ${busInfo.arrivalTime}'),
                    const SizedBox(height: 10.0),
                    Text('Total Seats: $totalSeats seats'),
                    const SizedBox(height: 10.0),
                    Text('Total Price:  $totalPrice EGP'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Passenger Information:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text('Name: $passengerName'),
                    const SizedBox(height: 10.0),
                    Text('Email: $passengerEmail'),
                    const SizedBox(height: 10.0),
                    Text('Phone Number: $passengerPhone'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(
                            '/'), // Go back to the home screen (replace based on your navigation setup)
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Print Ticket'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(
                            '/'), // Go back to the home screen (replace based on your navigation setup)
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Go Back Home'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
