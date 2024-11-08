class Seat {
  final bool isAvailable;
  final String position;
  bool isSelected; // Add isSelected property

  Seat(
      {required this.isAvailable,
      required this.position,
      this.isSelected = false});
}
