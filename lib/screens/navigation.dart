import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/screens/screens.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  Widget _currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                    });
                  }),
              IconButton(
                  iconSize: 35.0,
                  icon: Icon(Icons.add_box,
                      color: _selectedIndex == 1
                          ? Colors.pinkAccent
                          : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                      _currentScreen = Post();
                    });
                  }),
              IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.account_circle,
                      color: _selectedIndex == 2
                          ? Colors.pinkAccent
                          : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                      _currentScreen = Profile();
                    });
                  })
            ],
            indicatorColor: Colors.transparent,
          )),
    );
  }
}
