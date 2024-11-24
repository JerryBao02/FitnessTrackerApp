import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  bool isDayView = true; // Toggle between Day and Week views

  // Sample day log data
  final List<Map<String, dynamic>> dayLogs = [
    {
      "time": "8:30 AM",
      "activity": "Bench Press",
      "sets": "3 Sets",
      "details": [
        {"set": 1, "reps": 10, "weight": "100 lbs"},
        {"set": 2, "reps": 8, "weight": "135 lbs"},
        {"set": 3, "reps": 6, "weight": "145 lbs"}
      ]
    },
    {
      "time": "9:30 AM",
      "activity": "Dumbbell Row",
      "sets": "3 Sets",
      "details": [
        {"set": 1, "reps": 12, "weight": "50 lbs"},
        {"set": 2, "reps": 10, "weight": "60 lbs"},
        {"set": 3, "reps": 8, "weight": "70 lbs"}
      ]
    },
    {
      "time": "10:00 AM",
      "activity": "Squats",
      "sets": "3 Sets",
      "details": [
        {"set": 1, "reps": 15, "weight": "Bodyweight"},
        {"set": 2, "reps": 12, "weight": "135 lbs"},
        {"set": 3, "reps": 10, "weight": "185 lbs"}
      ]
    },
  ];

  // Sample week log data
  final List<Map<String, String>> weekLogs = [
    {"day": "Monday", "summary": "Bench Press, Dumbbell Row, Squats"},
    {"day": "Wednesday", "summary": "Deadlift, Pull-ups, Lunges"},
    {"day": "Friday", "summary": "Overhead Press, Push-ups, Plank"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity Log"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Toggle Buttons for Day/Week View
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButton(
                  label: "Day",
                  isActive: isDayView,
                  onTap: () {
                    setState(() {
                      isDayView = true;
                    });
                  },
                ),
                ToggleButton(
                  label: "Week",
                  isActive: !isDayView,
                  onTap: () {
                    setState(() {
                      isDayView = false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Display Day or Week Logs
            Expanded(
              child: isDayView ? _buildDayLogs() : _buildWeekLogs(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Day Logs
  Widget _buildDayLogs() {
    return ListView.builder(
      itemCount: dayLogs.length,
      itemBuilder: (context, index) {
        final log = dayLogs[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ExpansionTile(
            title: Text("${log["time"]} • ${log["activity"]}"),
            subtitle: Text(log["sets"]),
            children: log["details"].map<Widget>((detail) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Text(
                  "Set ${detail["set"]}: ${detail["reps"]} reps • ${detail["weight"]}",
                  style: TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // Widget for Week Logs
  Widget _buildWeekLogs() {
    return ListView.builder(
      itemCount: weekLogs.length,
      itemBuilder: (context, index) {
        final log = weekLogs[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(log["day"]!),
            subtitle: Text(log["summary"]!),
          ),
        );
      },
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const ToggleButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(color: isActive ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
