import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/widgets/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:poetry_blog_rebuild/data/data.dart';
import 'package:poetry_blog_rebuild/screens/screens.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontSize: 20,
            fontFamily: 'Pacifico',
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: 50.0,
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
                iconSize: 25.0,
                color: Colors.pinkAccent,
                onPressed: () {},
              ),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: getPosts,
        child: ListView(
          children: <Widget>[
            FutureBuilder(
                future: getPosts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        height: 200.0,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 8.0,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              // var initial = snapshot.data[index].username;
                              /*Get the timestamp */
                              var date = DateTime.parse(
                                  snapshot.data[index].created_at);
                              /*Find the difference in time from now in seconds */
                              var difference =
                                  DateTime.now().difference(date).inSeconds;

                              /*Format it into time ago */
                              var timeAgo = DateTime.now()
                                  .subtract(Duration(seconds: difference));
                              var timestamp = (timeago.format(timeAgo));
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PostScreen(
                                            postImageUrl:
                                                "${snapshot.data[index].imageUrl}",
                                            userImageUrl:
                                                "${snapshot.data[index].imageUrl}",
                                            title:
                                                "${snapshot.data[index].title}",
                                            author:
                                                "${snapshot.data[index].username}",
                                          ),
                                        ));
                                  },
                                  child: Trending(
                                    post: snapshot.data[index],
                                    timestamp: timestamp,
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } /*By default, show a loading spinner */
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 8.0),
                        Text("Loading posts..")
                      ],
                    ),
                  );
                }),
            FutureBuilder(
                future: getPosts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PostScreen(
                                        postImageUrl:
                                            "${snapshot.data[index].imageUrl}",
                                        userImageUrl:
                                            "${snapshot.data[index].imageUrl}",
                                        title: "${snapshot.data[index].title}",
                                        author:
                                            "${snapshot.data[index].username}",
                                      ),
                                    ));
                              },
                              child: PostContainer(post: snapshot.data[index]));
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } /*By default, show a loading spinner */
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 8.0),
                        Text("Loading posts..")
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
