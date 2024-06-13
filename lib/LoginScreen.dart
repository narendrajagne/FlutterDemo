import 'package:delbi/DashboardScreen.dart';
import 'package:delbi/HomeScreen.dart';
import 'package:delbi/main.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           // Curved Blue Background
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: 390,
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
                      'Flutter App',
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
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                  
              const Align(
                    alignment: Alignment.centerLeft, // Top right corner alignment
                    child: Text(
                        'Login',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                  ),
        
              const Align(
                    alignment: Alignment.centerLeft, // Top right corner alignment
                    child: Text(
                        'Welcome Back !',
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                  ),
                    // URL TextField
                    const SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.link),
                        labelText: 'URL',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // User Name TextField
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'User Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Password TextField
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Remember Me Checkbox
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (bool? value) {}),
                        const Text('Remember Me'),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    // Log in Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                                MaterialPageRoute(builder: (context) => const DashboardScreen()),
                             );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0092FF),
                          foregroundColor: const Color.fromRGBO(249, 249, 249, 1),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Log in'),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Forgot Password TextButton
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF0092FF),
                      ),
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
              ),
            ],
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