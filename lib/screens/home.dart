import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poetry_blog_rebuild/data/data.dart';
import 'package:poetry_blog_rebuild/models/models.dart';
import 'package:poetry_blog_rebuild/widgets/widgets.dart';

class Home extends StatefulWidget {
  final User currentUser;

  const Home({Key key, this.currentUser}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
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
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  bottomLeft: const Radius.circular(30.0),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.search),
                iconSize: 35.0,
                color: Colors.pinkAccent,
                onPressed: () {},
              ),
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
          sliver: SliverToBoxAdapter(
            child: Trending(
              posts: posts,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          },
          childCount: posts.length,
        )),
      ]),
    );
  }
}
