import 'package:flutter/material.dart';
import 'profile.dart'; // Import the ProfilePage
import 'add_action.dart'; // Import the AddActionPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> actions = [
    {
      'title': 'Test 1',
      'priority': 'Élevée',
      'deadline': 'Date limite il y a 4 mois',
      'assignedTo': 'Attribuée à Melek Mehrez',
      'updateTime': 'Mise à jour Il y a 5 mois',
      'status': 'Terminée',
      'priorityColor': '0xffFF0000',
      'statusColor': '0xffC8FACD',
      'documents': [],
    },
    {
      'title': 'Test 2',
      'priority': 'Moyenne',
      'deadline': 'Date limite il y a 2 mois',
      'assignedTo': 'Attribuée à Jean Dupont',
      'updateTime': 'Mise à jour Il y a 1 mois',
      'status': 'En cours',
      'priorityColor': '0xffFFA500',
      'statusColor': '0xffFFF3CD',
      'documents': [],
    },
    {
      'title': 'Test 3',
      'priority': 'Basse',
      'deadline': 'Date limite il y a 1 mois',
      'assignedTo': 'Attribuée à Marie Curie',
      'updateTime': 'Mise à jour Il y a 2 semaines',
      'status': 'Attente',
      'priorityColor': '0xff00FF00',
      'statusColor': '0xffD1E7DD',
      'documents': [],
    },
    // Add more actions here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildTopIcons(context),
          _buildActionButtons(),
          _buildListView(actions),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff9f9f9f),
            Color(0xff9f9f9f),
          ],
        ),
      ),
    );
  }

  Widget _buildTopIcons(BuildContext context) {
    return Positioned(
      top: 40.0,
      right: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildIcon('assets/user.png', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              }),
              const SizedBox(width: 35.0),
              _buildIcon('assets/notification.png', () {
                print('Bell icon tapped!');
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Positioned(
      top: 110.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildActionButton('My Actions', () {
            print('My Actions tapped!');
          }),
          const SizedBox(width: 45.0),
          _buildActionButton('All Actions', () {
            print('All Actions tapped!');
          }),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Text(text),
      ),
    );
  }

  Widget _buildIcon(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        width: 30.0,
        height: 30.0,
      ),
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> actions) {
    return Positioned(
      top: 170.0,
      left: 20.0,
      right: 20.0,
      bottom: 120.0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: ListView.builder(
          itemCount: actions.length,
          itemBuilder: (context, index) {
            return _buildListItem(actions[index]);
          },
        ),
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['title']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'AC-1',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.arrow_upward, color: Color(int.parse(item['priorityColor']!))),
              SizedBox(width: 5.0),
              Text(
                item['priority']!,
                style: TextStyle(color: Color(int.parse(item['priorityColor']!))),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(item['deadline']!),
          SizedBox(height: 5.0),
          Text(item['assignedTo']!),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item['updateTime']!),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Color(int.parse(item['statusColor']!)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  item['status']!,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          if (item['documents'] != null && item['documents'].isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documents:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...item['documents'].map<Widget>((doc) => Text('- $doc')).toList(),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem('assets/clipboard.png', 'Loupe tapped!'),
            _buildBottomNavItem('assets/chart.png', 'Home icon tapped!'),
            _buildBottomNavItem('assets/more.png', 'More icon tapped!', size: 60.0, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddActionPage(
                    onAddAction: (newAction) {
                      setState(() {
                        actions.add(newAction);
                      });
                    },
                  ),
                ),
              );
            }),
            _buildBottomNavItem('assets/loupe.png', 'Settings icon tapped!'),
            _buildBottomNavItem('assets/setting.png', 'Profile icon tapped!'),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String assetPath, String logMessage,
      {double size = 40.0, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {
        print(logMessage);
      },
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        width: size,
        height: size,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}
