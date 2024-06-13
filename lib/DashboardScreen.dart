
import 'package:delbi/AboutScreen.dart';
import 'package:delbi/LoginScreen.dart';
import 'package:delbi/ReportScreen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:delbi/HealthDashboard.dart';
import 'package:delbi/NotificationScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedToggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen())
                 );
              // Handle the notification icon press
            },
          ),
        ],
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
                Navigator.pop(context); // Close the drawer
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Live'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Mall-wise'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Zone-wise'),
                ),
              ],
              isSelected: [
                _selectedToggleIndex == 0,
                _selectedToggleIndex == 1,
                _selectedToggleIndex == 2,
              ],
              onPressed: (int index) {
                setState(() {
                  _selectedToggleIndex = index;
                });
              },
            ),

            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                             Text('Live Counts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                             Text('2023/05/16'),
                             Text('12:05:38'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('428', style: TextStyle(fontSize: 24, color: Colors.green)),
                            Text('Total In'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('257', style: TextStyle(fontSize: 24, color: Colors.red)),
                            Text('Total Out'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
    
            SizedBox(height: 20),
            Text('Live counts per hour'),

            SizedBox(height: 20),
            ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Bar'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Line'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Area'),
                ),
              ],
              isSelected: [
                _selectedToggleIndex == 0,
                _selectedToggleIndex == 1,
                _selectedToggleIndex == 2,
              ],
              onPressed: (int index) {
                setState(() {
                  _selectedToggleIndex = index;
                });
              },
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Container(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(showTitles: true),
                            bottomTitles: SideTitles(showTitles: true),
                          ),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 100),
                                FlSpot(1, 200),
                                FlSpot(2, 400),
                                FlSpot(3, 800),
                                FlSpot(4, 600),
                                FlSpot(5, 400),
                                FlSpot(6, 200),
                              ],
                              isCurved: true,
                              colors: [Colors.green],
                              barWidth: 4,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: true, colors: [Colors.green.withOpacity(0.3)]),
                            ),
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 50),
                                FlSpot(1, 150),
                                FlSpot(2, 300),
                                FlSpot(3, 812),
                                FlSpot(4, 500),
                                FlSpot(5, 300),
                                FlSpot(6, 100),
                              ],
                              isCurved: true,
                              colors: [Colors.red],
                              barWidth: 4,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: true, colors: [Colors.red.withOpacity(0.3)]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Note: The counts are updated in every 5 minutes'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
