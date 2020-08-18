import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
            ),
          ),
          title: Text(
            'Home',
            style: const TextStyle(
              color: Colors.pinkAccent,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.search),
                iconSize: 30.0,
                color: Colors.pinkAccent,
                onPressed: () {},
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Trending(),
        )
      ]),
    );
  }
}
