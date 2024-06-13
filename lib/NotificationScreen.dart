import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:delbi/LoginScreen.dart';
import 'package:delbi/AboutScreen.dart';
import 'package:delbi/DashboardScreen.dart';
import 'package:delbi/HealthDashboard.dart';
import 'package:delbi/ReportScreen.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  bool dailyAlerts = true;
  bool weeklyAlerts = true;
  bool monthlyAlerts = false;
  bool deviceOfflineAlerts = true;
  bool alertsOne = true;
  bool alertsTwo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('FlutterDev'),
              accountEmail: Text('Admin'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50.0,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Count Dashboard'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardScreen())
                 );// Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text('Health Dashboard'),
              onTap: () {
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HealthDashboard())
                 );
               // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportScreen())
                 ); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen())
                 ); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
     
      body: ListView(
        children: [
          ListTile(
            title: Text('Daily alerts'),
            trailing: Switch(
              value: dailyAlerts,
              onChanged: (bool value) {
                setState(() {
                  dailyAlerts = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Weekly alerts'),
            trailing: Switch(
              value: weeklyAlerts,
              onChanged: (bool value) {
                setState(() {
                  weeklyAlerts = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Monthly alerts'),
            trailing: Switch(
              value: monthlyAlerts,
              onChanged: (bool value) {
                setState(() {
                  monthlyAlerts = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Device offline alerts'),
            trailing: Switch(
              value: deviceOfflineAlerts,
              onChanged: (bool value) {
                setState(() {
                  deviceOfflineAlerts = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Alerts one'),
            trailing: Switch(
              value: alertsOne,
              onChanged: (bool value) {
                setState(() {
                  alertsOne = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Alerts two'),
            trailing: Switch(
              value: alertsTwo,
              onChanged: (bool value) {
                setState(() {
                  alertsTwo = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
