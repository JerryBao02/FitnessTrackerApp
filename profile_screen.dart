import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              "User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("@username", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue), // Updated icon style
              title: Text("Name"),
              subtitle: Text("User"),
              trailing: Icon(Icons.edit, color: Colors.grey),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue), // Updated icon style
              title: Text("Email"),
              subtitle: Text("user@example.com"),
              trailing: Icon(Icons.edit, color: Colors.grey),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue), // Updated icon style
              title: Text("Location"),
              subtitle: Text("New York, USA"),
              trailing: Icon(Icons.edit, color: Colors.grey),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.privacy_tip, color: Colors.blue), // Updated icon style
              title: Text("Privacy Settings"),
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.blue), // Updated icon style
              title: Text("Help Center"),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                // Log out functionality
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
