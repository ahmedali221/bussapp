import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Utils/Constants.dart';
import '../Utils/CustomNumberStepper.dart';
import 'BusResultPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fromCity = "";
  String toCity = "";
  DateTime selectedDate = DateTime.now();
  int numberOfPeople = 1; // Default to 1 person
  String? selectedFromCity; // Store the selected fromCity dropdown value
  String? selectedToCity; // Store the selected toCity dropdown value

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025, 12, 31),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _swapCities() {
    // Swap selected city values
    final tempCity = selectedFromCity;
    selectedFromCity = selectedToCity;
    selectedToCity = tempCity;
    setState(() {});
  }

  void _navigateToSearchResults() {
    // Basic validation
    if (selectedFromCity == null || selectedToCity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both origin and destination cities'),
        ),
      );
      return;
    }

    // Navigate to SearchResultsPage with user input
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BusResultsPage(
          fromCity: selectedFromCity!,
          toCity: selectedToCity!,
          travelDate: selectedDate,
          numberOfPeople: numberOfPeople,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Booking App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Your Destination',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 30),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedFromCity,
                      focusColor: Colors.transparent,
                      hint: const Text('From City'),
                      items: egyptianCities
                          .map((city) => DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedFromCity = value),
                      validator: (value) =>
                          value == null ? 'Please select a city' : null,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20.0),
                            right: Radius.circular(0.0), // Stadium effect
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20.0),
                            right: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.swap_horiz),
                    onPressed: _swapCities,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedToCity,
                      focusColor: Colors.transparent,
                      hint: const Text('To City'),
                      items: egyptianCities
                          .map((city) => DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedToCity = value),
                      validator: (value) =>
                          value == null ? 'Please select a city' : null,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(0.0), // Stadium effect
                            right: Radius.circular(20.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(0.0), // Stadium effect
                            right: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Number of People:'),
                  const SizedBox(width: 10.0),
                  CustomNumberStepper(
                    value: numberOfPeople,
                    min: 1,
                    max: 10, // Adjust max as needed
                    onChanged: (value) =>
                        setState(() => numberOfPeople = value),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Date: ${DateFormat('EEEE, yyyy-MM-dd').format(selectedDate)}',
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _navigateToSearchResults,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Search Buses'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
