import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Role'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/serviceList');
                // Replace '/service_dashboard' with the actual route for the service role
              },
              child: Text('Service'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/petList');
                // Replace '/user_dashboard' with the actual route for the user role
              },
              child: Text('Pet owner'),
            ),
          ],
        ),
      ),
    );
  }
}
