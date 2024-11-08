import 'package:bussapp/Presentation/PaymentPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/BusInfo.dart';

class BookingPage extends StatefulWidget {
  final BusInfo busInfo;
  final int totalSeats;

  const BookingPage({
    Key? key,
    required this.busInfo,
    required this.totalSeats,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String passengerName = '';
  String passengerEmail = '';
  String passengerPhone = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final int totalPrice = widget.totalSeats * widget.busInfo.price;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bus Information:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              '${widget.busInfo.companyName} - ${widget.busInfo.departureTime} to ${widget.busInfo.arrivalTime}',
            ),
            const SizedBox(height: 10.0),
            Text(
              'Total Seats: ${widget.totalSeats} seats',
            ),
            const SizedBox(height: 10.0),
            Text(
              'Total Price:  $totalPrice EGP',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Passenger Information:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null; // No validation error
                    },
                    decoration: InputDecoration(
                      prefixIconColor: WidgetStateColor.resolveWith((states) =>
                          states.contains(WidgetState.focused)
                              ? Colors.black
                              : Colors.grey),
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Name',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        // Adjust radius as needed
                      ),
                    ),
                    onChanged: (value) => setState(() => passengerName = value),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
                          .hasMatch(value)) {
                        return 'Invalid email format';
                      }
                      return null; // No validation error
                    },
                    decoration: InputDecoration(
                      prefixIconColor: WidgetStateColor.resolveWith((states) =>
                          states.contains(WidgetState.focused)
                              ? Colors.black
                              : Colors.grey),
                      prefixIcon: const Icon(Icons.email),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        // Adjust radius as needed
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) =>
                        setState(() => passengerEmail = value),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.length > 14) {
                        return 'Please enter valid phone number';
                      }
                      return null; // No validation error (more complex validation can be added)
                    },
                    decoration: InputDecoration(
                      prefixText: '+20 ',
                      prefixIconColor: WidgetStateColor.resolveWith((states) =>
                          states.contains(WidgetState.focused)
                              ? Colors.black
                              : Colors.grey),
                      prefixIcon: const Icon(Icons.phone),
                      labelText: 'Phone Number',
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        // Adjust radius as needed
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) =>
                        setState(() => passengerPhone = value),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Validate the form using the Form's key
                  if (_formKey.currentState!.validate()) {
                    // Navigate to PaymentPage if validation is successful
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          passengerName: passengerName,
                          passengerEmail: passengerEmail,
                          passengerPhone: passengerPhone,
                          busInfo: widget.busInfo,
                          totalSeats: widget.totalSeats,
                        ),
                      ),
                    );
                  } else {
                    // Optional: Show a snackbar or other visual cue to indicate validation errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please fix form errors to proceed')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Proceed to Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
