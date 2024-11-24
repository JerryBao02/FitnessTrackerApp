import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to Settings Screen
              showSnackbar(context, "Settings button pressed");
            },
          ),
        ],
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
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text("User"),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Edit Name functionality
                showSnackbar(context, "Edit Name button pressed");
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("user@example.com"),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Edit Email functionality
                showSnackbar(context, "Edit Email button pressed");
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Location"),
              subtitle: Text("New York, USA"),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Edit Location functionality
                showSnackbar(context, "Edit Location button pressed");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text("Privacy Settings"),
              onTap: () {
                // Navigate to Privacy Settings
                showSnackbar(context, "Privacy Settings button pressed");
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help Center"),
              onTap: () {
                // Navigate to Help Center
                showSnackbar(context, "Help Center button pressed");
              },
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                // Log out functionality
                showSnackbar(context, "Log Out button pressed");
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

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
