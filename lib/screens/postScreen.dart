import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final String postImageUrl, userImageUrl, title, author, description;
  final int likes, comments;

  const PostScreen(
      {Key key,
      this.postImageUrl,
      this.userImageUrl,
      this.title,
      this.author,
      this.likes,
      this.comments,
      this.description})
      : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class Int {}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.postImageUrl),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .15,
                      right: 20.0,
                      left: 20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0)),
                    ),
                    elevation: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        bottom: 30.0,
                      ),
                      child: Wrap(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 18.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20.0,
                                    backgroundImage: CachedNetworkImageProvider(
                                        widget.userImageUrl),
                                  ),
                                  Text(
                                    widget.author,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Text(
                                    widget.title,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(widget.description,
                                    style: TextStyle(fontSize: 14.0),
                                    textAlign: TextAlign.justify),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite,
                                                size: 20.0,
                                                color: Colors.red,
                                              ),
                                              onPressed: null),
                                          Text(
                                            widget.likes.toString(),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                Icons.mode_comment,
                                                size: 20.0,
                                                color: Colors.grey[400],
                                              ),
                                              onPressed: null),
                                          Text(widget.comments.toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15.0,
                          backgroundImage:
                              CachedNetworkImageProvider(widget.userImageUrl),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Add a comment. . .',
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
