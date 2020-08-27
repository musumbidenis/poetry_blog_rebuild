import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/models/models.dart';
import 'package:poetry_blog_rebuild/repository/postsRepo.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  List<Post1> posts = <Post1>[];

  @override
  void initState() {
    super.initState();
    listenForPosts();
  }

  void listenForPosts() async {
    final Stream<Post1> stream = await getPosts1();
    stream.listen((Post1 post) => setState(() => posts.add(post)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top Beers'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => Column(
          children: <Widget>[
            ListTile(
              title: Text(posts[index].title),
              subtitle: Text(posts[index].username),
              leading: Container(
                  margin: EdgeInsets.only(left: 6.0),
                  child: Image.network(
                    posts[index].imageUrl,
                    height: 50.0,
                    fit: BoxFit.fill,
                  )),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
