// Main entry point for the app
import 'package:flutter/material.dart';
import 'login.dart';
import 'createaccount.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FitnessTrackerScreen(), // Load main fitness screen
    );
  }
}

class FitnessTrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title text for the welcome screen
              Text(
                'Welcome To Fitness Tracker!',
                style: TextStyle(
                  fontSize: 24, // Maintained original font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 20), // Consistent spacing
              
              // Image container for visual appeal
              Container(
                width: double.infinity,
                height: 250, // Maintained original image height
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/appimage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              SizedBox(height: 20), // Consistent spacing

              // Motivational text
              Text(
                'Do it for the past version of yourself!',
                style: TextStyle(
                  fontSize: 16, // Kept the font size
                  color: Colors.grey[600], // Adjusted grey tone slightly
                ),
              ),
              
              SizedBox(height: 30), // Consistent spacing
              
              // Log In button with styling adjustments
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Light grey as requested
                  foregroundColor: Colors.black, // Black text color
                  minimumSize: Size(200, 50), // Kept original size
                ),
                child: Text('Log In'),
              ),
              
              SizedBox(height: 10), // Maintained original spacing
              
              // Sign Up button with some styling changes
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue color for contrast
                  minimumSize: Size(200, 50), // Kept original size
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

