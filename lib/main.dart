import 'package:flutter/material.dart';
import 'package:project_sanctuaryv2/features/discover/views/discover_screen.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages =  <Widget>[
    DiscoverScreen(),
    Center(child: Text('Locations Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings Screen', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Project Sanctuary')),
      // Displays the currently selected screen
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color.fromARGB(139, 158, 158, 158),
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_city_sharp),
                label: 'Locations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
