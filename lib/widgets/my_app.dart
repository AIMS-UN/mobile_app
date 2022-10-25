import 'package:flutter/material.dart';

import '../themes/light.dart';
import '../views/auth/auth_view.dart';
import 'background.dart';

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
  static int _selectedIndex = 0;

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // creat a login status variable
  bool _isLoggedIn = false;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const Background(
            child: Text('Index 0: Home', style: optionStyle),
          ),
          const Background(
            child: Text('Index 3: Settings', style: optionStyle),
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
                  // auth icon
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
