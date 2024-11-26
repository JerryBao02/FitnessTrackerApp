import 'package:flutter/material.dart';

class BodyHeatMapScreen extends StatefulWidget {
  @override
  _BodyHeatMapScreenState createState() => _BodyHeatMapScreenState();
}

class _BodyHeatMapScreenState extends State<BodyHeatMapScreen> {
  bool isDayView = true; // Toggle between Day and Week views
  bool isFrontView = true; // Toggle between Front and Back views
  DateTime? selectedDate;

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Heat Map"),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Toggle Buttons for Day/Week
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("Day", isDayView, () {
                  setState(() {
                    isDayView = true;
                  });
                }),
                _buildToggleButton("Week", !isDayView, () {
                  setState(() {
                    isDayView = false;
                  });
                }),
              ],
            ),
            const SizedBox(height: 16),

            // Pick a Date and Filter Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_today, color: Colors.black),
                  label: const Text(
                    "Pick a Date",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.filter_alt_outlined, color: Colors.blue),
                      onPressed: () {
                        // Add filter functionality here
                      },
                    ),
                    const Positioned(
                      right: 4,
                      top: 4,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          "4",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Front/Back Toggle Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("Front", isFrontView, () {
                  setState(() {
                    isFrontView = true;
                  });
                }),
                _buildToggleButton("Back", !isFrontView, () {
                  setState(() {
                    isFrontView = false;
                  });
                }),
              ],
            ),
            const Spacer(),

            // View Overview Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Overview or perform an action
              },
              child: const Text("View Overview"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
