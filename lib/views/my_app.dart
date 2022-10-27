import 'package:flutter/material.dart';

import '/themes/light.dart';
import '/widgets/background.dart';
import 'auth/auth_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ktdLight,
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<StatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  static int _selectedIndex = 1;

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const Background(
            child: Text(
              'Business',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Background(
            child: Text(
              'Home',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Background(
            child: AuthView(isLoggedIn: (newStatus) {
              setState(() => _isLoggedIn = newStatus);
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          _isLoggedIn
              ? const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                )
              : const BottomNavigationBarItem(
                  icon: Icon(Icons.login),
                  label: 'Auth',
                ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _updateIndex,
      ),
    );
  }
}
