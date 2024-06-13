import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _url = "";
  String _username = "";
  String _password = "";
  bool? _rememberMe = false;

  void _handleLogin() {
    // Validate input and simulate login process
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        
        child: SingleChildScrollView( // Wrap content in SingleChildScrollView for overflow handling on small 
        
            
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Curved Blue Background
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: 250,
              color: Colors.blue,
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // App Icon
                    Icon(
                      Icons.insert_chart,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    // App Title
                    Text(
                      'DELBI 2.0',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        
                const Align(
                    alignment: Alignment.centerLeft, // Top right corner alignment
                    child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                  ),
      
                  const Align(
                    alignment: Alignment.centerLeft, // Top right corner alignment
                    child: Text(
                        'Welcome Back !',
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                  ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("URL*"),
                ),
                TextField(
                  decoration: InputDecoration (
                    border: OutlineInputBorder (
                      borderSide: const BorderSide (color: Colors.blue,
                      width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                     onChanged: (value) => setState(() => _url = value),
                ),
              const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("User Name*"),
                ),
                TextField(
                  decoration: InputDecoration (
                    border: OutlineInputBorder (
                      borderSide: const BorderSide (color: Colors.blue,
                      width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                     onChanged: (value) => setState(() => _username = value),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password*"),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder (
                      borderSide: const BorderSide (color: Colors.blue,
                      width: 0.5),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ), // Add asterisk for required field
                  obscureText: true, // Hide password characters
                  onChanged: (value) => setState(() => _password = value),
                ),
                Row( // Row for checkbox and text
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) => setState(() => _rememberMe = value),
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1.2, // 50% of screen width
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                   // Your button action
               },
               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text('Log in'),
                ),
          ),
                TextButton( // Use TextButton for Forgot Password
                  onPressed: () => {}, // Handle Forgot Password functionality
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width , 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}