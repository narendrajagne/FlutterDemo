import 'package:delbi/AboutScreen.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:delbi/LoginScreen.dart';
import 'package:delbi/DashboardScreen.dart';
import 'package:delbi/ReportScreen.dart';
import 'package:delbi/AboutScreen.dart';
import 'package:delbi/NotificationScreen.dart';



class HealthDashboard extends StatefulWidget {
  const HealthDashboard({super.key});

  @override
  _HealthDashboardState createState() => _HealthDashboardState();
}

class _HealthDashboardState extends State<HealthDashboard> {

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
                 );// Handle the notification icon press
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
              onTap: () {
                Navigator.pop(context);
               // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report'),
              onTap: () { Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportScreen())
                 );
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
            _buildToggleButtons(),
            PieChart(
          dataMap: dataMap,
          //chartColors: [Colors.red, Colors.yellow, Colors.orange, Colors.green],
          //hartLegend: dataMap.keys.toList(),
          animationDuration: Duration(milliseconds: 400),
        ),
           // _buildStatusChart(),
            _buildStatusButtons(),
            _buildSearchBar(),
            _buildHealthStatusList(),
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
          child: Text('Health Status'),
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
          child: Text('Mall Health Status'),
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