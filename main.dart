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
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 20), 
              
              // Image container for visual appeal
              Container(
                width: double.infinity,
                height: 250, 
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/appimage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              SizedBox(height: 20),

              // Motivational text
              Text(
                'Do it for the past version of yourself!',
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.grey[600], 
                ),
              ),
              
              SizedBox(height: 30), 
              
        
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], 
                  foregroundColor: Colors.black, 
                  minimumSize: Size(200, 50), 
                ),
                child: Text('Log In'),
              ),
              
              SizedBox(height: 10), 
              
           
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(200, 50), 
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
