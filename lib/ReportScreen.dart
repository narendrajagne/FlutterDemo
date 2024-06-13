import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:delbi/LoginScreen.dart';
import 'package:delbi/AboutScreen.dart';
import 'package:delbi/DashboardScreen.dart';
import 'package:delbi/HealthDashboard.dart';
import 'package:delbi/NotificationScreen.dart';



class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  bool showHealthStatus = true;

  // Define your pie chart data
  Map<String, double> dataMap = {
    "Online": 94,
    "Offline": 67,
    "Online Idle": 72
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Pie Chart Demo'),
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
      //body: Center(
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
              onTap: () { Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardScreen())
                 );
              },
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text('Health Dashboard'),
              onTap: () { Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HealthDashboard())
                 );
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () { Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen())
                 );
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
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
             SizedBox(height: 10),
            _buildToggleButtons(),
            SizedBox(height: 10),
            _cardViewButtons(),
            SizedBox(height: 10),
            _buildSearchBar(),
            SizedBox(height: 10),
            _buildHealthStatusList(),
          ],
        ),
      ),
    );
  }



Widget _cardViewButtons() {
    return  Card(
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
            );
}

Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: showHealthStatus ? Colors.blue : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              showHealthStatus = true;
            });
          },
          child: Text('Mall-wise'),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: showHealthStatus ? Colors.grey : Colors.blue,
          ),
          onPressed: () {
            setState(() {
              showHealthStatus = false;
            });
          },
          child: Text('Zone-wise'),
        ),
      ],
    );
  }


  Widget _buildStatusButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Online'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Offline'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Online Idle'),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Filter action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStatusList() {
    return Expanded(
      child: ListView(
        children: [
          _buildHealthStatusItem('STRIDE-V-1-3-GND-MASTER:09e34', '2024-05-15 09:55:13'),
          _buildHealthStatusItem('STRIDE:09dd1', '2024-05-15 08:23:01'),
          _buildHealthStatusItem('V1-3-GND-P-BOOST:09e47', '2024-05-15 07:09:42'),
          _buildHealthStatusItem('STRIDE-V-1-3-GND-MASTER:09e34', '2024-05-14 06:00:37'),
          _buildHealthStatusItem('STRIDE:09dd1', '2024-05-14 03:12:56'),
        ],
      ),
    );
  }

  Widget _buildHealthStatusItem(String title, String timestamp) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.lock_outline),
        title: Text(title),
        subtitle: Text(timestamp),
      ),
    );
  }

}