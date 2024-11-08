import 'package:bussapp/Presentation/ConfirmBooking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/BusInfo.dart';
import '../Utils/ExpiryDateFormatter.dart';

class PaymentPage extends StatefulWidget {
  final String passengerName;
  final String passengerEmail;
  final String passengerPhone;
  final BusInfo busInfo;
  final int totalSeats;

  const PaymentPage({
    Key? key,
    required this.passengerName,
    required this.passengerEmail,
    required this.passengerPhone,
    required this.busInfo,
    required this.totalSeats,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  String cardNumber = '';
  String cvv = '';
  String expiryDate = '';
  String cardholderName = '';

  @override
  Widget build(BuildContext context) {
    final int totalPrice = widget.totalSeats * widget.busInfo.price;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Booking Summary:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.busInfo.companyName} ',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.busInfo.departureTime} to ${widget.busInfo.arrivalTime}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Seats: ${widget.totalSeats} seats',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Price:  $totalPrice EGP',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  'Payment Information:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Name: ${widget.passengerName}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Email: ${widget.passengerEmail}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Phone: ${widget.passengerPhone}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Card Information:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIconColor: WidgetStateColor.resolveWith((states) =>
                      states.contains(WidgetState.focused)
                          ? Colors.black
                          : Colors.grey),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Icon(Icons.person_2),
                  ),
                  labelText: 'Cardholder Name',
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cardholder name';
                  }
                  return null;
                },
                onSaved: (value) =>
                    cardholderName = value!, // Save entered value
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  CardNumberInputFormatter()
                ],
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIconColor: WidgetStateColor.resolveWith((states) =>
                      states.contains(WidgetState.focused)
                          ? Colors.black
                          : Colors.grey),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Icon(Icons.credit_card),
                  ),
                  labelText: 'Card Number',
                  labelStyle: const TextStyle(color: Colors.grey),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter card number';
                  }
                  return null;
                },
                onSaved: (value) => cardNumber = value!, // Save entered value
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIconColor: WidgetStateColor.resolveWith(
                            (states) => states.contains(WidgetState.focused)
                                ? Colors.black
                                : Colors.grey),
                        prefixIcon: const Icon(Icons.numbers),
                        labelText: 'CVV',
                        labelStyle: const TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true, // Hide CVV input
                      // Limit CVV to 3 digits
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter CVV';
                        }
                        return null;
                      },
                      onSaved: (value) => cvv = value!, // Save entered value
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Flexible(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ExpiryDateInputFormatter(),
                        LengthLimitingTextInputFormatter(
                            5), // Limit to 5 characters (MM/YY)
                      ],
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIconColor: WidgetStateColor.resolveWith(
                            (states) => states.contains(WidgetState.focused)
                                ? Colors.black
                                : Colors.grey),
                        prefixIcon: const Icon(Icons.date_range),
                        labelText: 'Expiry Date (MM/YY)',
                        labelStyle: const TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter expiry date';
                        }

                        // Check format (MM/YY)
                        if (value.length != 5 ||
                            value.contains(RegExp(r'[^\d/]')) ||
                            !value.contains('/')) {
                          return 'Invalid expiry date format (MM/YY)';
                        }

                        // Validate month (1-12)
                        final month = int.tryParse(value.substring(0, 2)) ?? 0;
                        if (month < 1 || month > 12) {
                          return 'Invalid month (1-12)';
                        }

                        // Validate year (future year)
                        final currentYear = DateTime.now().year;
                        final year = int.tryParse(value.substring(3)) ?? 0;
                        if (year < currentYear % 100) {
                          return 'Expired card'; // Assuming validation for cards expiring this year (YY)
                        }

                        return null;
                      },
                      onSaved: (value) =>
                          expiryDate = value!, // Save entered value
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save(); // Trigger form saving

                      // Implement your logic to process payment
                      // Replace with actual payment processing (e.g., integration with a payment gateway)
                      print(
                          'Processing payment for ${widget.passengerName}...');
                      // Simulate successful payment
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationPage(
                              passengerName: widget.passengerName,
                              passengerEmail: widget.passengerEmail,
                              passengerPhone: widget.passengerPhone,
                              busInfo: widget.busInfo,
                              totalSeats: widget.totalSeats,
                            ),
                          ),
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Proceed to Booking'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write("  ");
      } // double space
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}
