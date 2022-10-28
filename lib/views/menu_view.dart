import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '/widgets/background.dart';
import 'profile_view.dart';

class Menu extends StatefulWidget {
  const Menu(this.number, {super.key});
  final int number;

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  PageController pagecontrol = PageController();
  int numpage = 0;

  void onPage(int b) {
    setState(() {
      numpage = b;
    });
  }

  void onTapped(int a) {
    pagecontrol.jumpToPage(a);
  }

  @override
  void initState() {
    super.initState();
    numpage = widget.number;
    pagecontrol = PageController(initialPage: numpage);
  }

  @override
  Widget build(BuildContext context) {
    const items = <Widget>[
      Icon(Icons.grading, size: 30, color: Colors.white),
      Icon(Icons.calendar_month_outlined, size: 30, color: Colors.white),
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.search, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white),
    ];

    const children = <Widget>[
      Background(child: Text('Home')),
      Background(child: Text('Calendar')),
      Background(child: Text('Grading')),
      Background(child: Text('Search')),
      ProfileView(),
    ];

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'AIMS mobile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xff3a85c7),
        automaticallyImplyLeading: true,
      ),
      body: IndexedStack(
        index: numpage,
        children: children,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        // color: const Color(0xff3a85c7),
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        index: numpage,
        onTap: onPage,
        animationDuration: const Duration(milliseconds: 200),
        height: 60,
      ),
    );
  }
}
