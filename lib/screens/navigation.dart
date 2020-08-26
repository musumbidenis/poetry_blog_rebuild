import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/screens/screens.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index

  // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add_box,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreatePost()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(left: 80.0),
              icon: Icon(
                Icons.home,
                color: currentTab == 0 ? Colors.redAccent : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentScreen = Home();
                  currentTab = 0;
                });
              },
            ),
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(right: 80.0),
              icon: Icon(
                Icons.account_circle,
                color: currentTab == 1 ? Colors.redAccent : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentScreen = Profile();
                  currentTab = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class Navigation extends StatefulWidget {
//   @override
//   _NavigationState createState() => _NavigationState();
// }

// class _NavigationState extends State<Navigation> {
//   int _selectedIndex = 0;
//   List<Widget> _screens = [
//     Home(),
//     CreatePost(),
//     Profile(),
//   ];

//   void _onTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 20.0,
//         items: [
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: const EdgeInsets.only(top: 5.0),
//               child: Icon(
//                 Icons.home,
//                 size: 20.0,
//               ),
//             ),
//             title: Text(''),
//           ),
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: const EdgeInsets.only(top: 5.0),
//               child: Icon(
//                 Icons.add_box,
//                 size: 20.0,
//               ),
//             ),
//             title: Text(''),
//           ),
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: const EdgeInsets.only(top: 5.0),
//               child: Icon(
//                 Icons.account_circle,
//                 size: 20.0,
//               ),
//             ),
//             title: Text(''),
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.pinkAccent,
//         onTap: _onTapped,
//       ),
//     );
//   }
// }
