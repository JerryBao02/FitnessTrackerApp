import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome User"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Weekly Summary Section
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _summaryTile("Logs", "10", "Previous: 5", Colors.blue),
                  _summaryTile("Muscles", "5", "Previous: 3", Colors.green),
                  _summaryTile("Time Spent", "45 min", "Previous: 1 hour", Colors.red),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Body Heat Map Section
            Stack(
              alignment: Alignment.center,
              children: [
                // Blue Border
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 4.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(0.0), // Ensures spacing around the image
                  child: Image.asset(
                    'assets/body_heat_map.png',
                    height: MediaQuery.of(context).size.height * 0.6, // Double the size
                    fit: BoxFit.contain, // Ensure proper image fitting
                  ),
                ),
                // Percentage Indicator
                Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    radius: 35, // Adjusted size to match doubled image
                    backgroundColor: Colors.white,
                    child: Text(
                      "78.6%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Week Label
            Text(
              "Week : 9/25 - 10/2",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryTile(String title, String value, String subtitle, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
