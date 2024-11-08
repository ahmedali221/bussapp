import 'package:flutter/material.dart';

import '../Models/Seats.dart';

class SeatIcon extends StatelessWidget {
  final Seat seat;
  final Function(String) onSeatSelected;

  const SeatIcon({
    Key? key,
    required this.seat,
    required this.onSeatSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSeatSelected(seat.position),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: seat.isSelected
              ? Colors.blue
              : (seat.isAvailable ? Colors.green : Colors.red),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            seat.position,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
