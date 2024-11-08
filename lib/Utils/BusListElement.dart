import 'package:flutter/material.dart';

import '../Models/BusInfo.dart';
import '../Presentation/BusDetailedPage.dart';

class BusListElement extends StatelessWidget {
  const BusListElement({
    super.key,
    required this.busInfo,
    required this.fromCity,
    required this.toCity,
  });

  final BusInfo busInfo;
  final String fromCity;
  final String toCity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusDetailsPage(
              busInfo: busInfo,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min, // Avoid stretching icons
              children: [
                const Icon(Icons.directions_bus),
                const SizedBox(width: 5.0),
                Text(busInfo.companyName,
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w800)),
              ],
            ),
            title: Text(
              '${busInfo.departureTime} - ${busInfo.arrivalTime}',
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Text(
              '${busInfo.price.toString()} EGP / Seat',
              style:
                  const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
