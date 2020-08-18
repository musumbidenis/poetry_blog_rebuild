import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/screens/screens.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  Widget _currentScreen = Home();
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: _currentScreen,
          bottomNavigationBar: TabBar(
            tabs: [
              IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.home,
                      color: _selectedIndex == 0
                          ? Colors.pinkAccent
                          : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                      _currentScreen = Home();
                      _isActive = true;
                    });
                  }),
              IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.settings,
                      color: _selectedIndex == 1
                          ? Colors.pinkAccent
                          : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                      _currentScreen = Profile();
                      _isActive = true;
                    });
                  })
            ],
            indicator: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: _isActive ? Colors.pinkAccent : Colors.grey,
              width: 3.0,
            ))),
            indicatorColor: Colors.transparent,
          )),
    );
  }
}
