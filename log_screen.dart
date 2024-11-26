import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  bool isDayView = true; // Toggle between Day and Week views

  final List<Map<String, dynamic>> logs = [
    {
      "time": "8:30 AM",
      "activity": "Bench Press",
      "sets": 3,
      "details": [
        {"set": 1, "reps": 10, "weight": "100 lbs"},
        {"set": 2, "reps": 8, "weight": "135 lbs"},
        {"set": 3, "reps": 6, "weight": "145 lbs"}
      ]
    },
    {
      "time": "9:30 AM",
      "activity": "Dumbbell Row",
      "sets": 3,
      "details": [
        {"set": 1, "reps": 12, "weight": "50 lbs"},
        {"set": 2, "reps": 10, "weight": "60 lbs"},
        {"set": 3, "reps": 8, "weight": "70 lbs"}
      ]
    },
    {
      "time": "10:00 AM",
      "activity": "Squats",
      "sets": 3,
      "details": [
        {"set": 1, "reps": 15, "weight": "Bodyweight"},
        {"set": 2, "reps": 12, "weight": "135 lbs"},
        {"set": 3, "reps": 10, "weight": "185 lbs"}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Log"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Toggle Day/Week view
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),

          // Date and Filter Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      "Wed, Oct 2, 2024",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Add filter functionality
                      },
                      icon: Icon(Icons.filter_list, color: Colors.blue),
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          "4",
                          style: const TextStyle(
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
          ),

          // Logs List
          Expanded(
            child: ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: ExpansionTile(
                    title: Text(
                      "${log["time"]} • ${log["activity"]}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Sets: ${log["sets"]}"),
                    children: log["details"].map<Widget>((detail) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Text(
                          "Set ${detail["set"]}: ${detail["reps"]} reps • ${detail["weight"]}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
