import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController(text: 'johndoe@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+1234567890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replacing Colors.grey[200] with a custom hex color code
      backgroundColor: Color(0xFFC5C5C5), // Hex color code equivalent to Colors.grey[200]
      body: SafeArea(
        child: SingleChildScrollView(  // Wrap with SingleChildScrollView to handle overflow
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back to the previous page
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Center(
                child: Column(
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Color(0xFFFFFFFF),
                      child: Icon(
                        Icons.person,
                        size: 60.0,
                        color: Color(0xFF9F9F9F),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        // Handle photo change here
                        print('Change photo tapped!');
                      },
                      child: Text(
                        'Change photo',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              // Email field
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 20.0),
              // Phone number field
              Text(
                'Telephone',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
