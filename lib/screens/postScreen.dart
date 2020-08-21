import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final String postImageUrl, userImageUrl, title, author;
  final int likes, comments;

  const PostScreen(
      {Key key,
      this.postImageUrl,
      this.userImageUrl,
      this.title,
      this.author,
      this.likes,
      this.comments})
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
          // SliverAppBar(
          //   brightness: Brightness.light,
          //   backgroundColor: Colors.white,
          //   leading: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Icon(
          //         Icons.arrow_back,
          //         color: Colors.black54,
          //         size: 30.0,
          //       )),
          //   title: Text(
          //     'Go Back',
          //     style: const TextStyle(
          //       color: Colors.black54,
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   centerTitle: false,
          //   floating: true,
          //   elevation: 0,
          // ),
          SliverToBoxAdapter(
              child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.postImageUrl),
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
                                    radius: 35.0,
                                    backgroundImage: CachedNetworkImageProvider(
                                        widget.userImageUrl),
                                  ),
                                  Text(
                                    widget.author,
                                    style: TextStyle(
                                      fontSize: 15.0,
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
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla feugiat enim orci, id rhoncus enim lacinia at. Duis eu turpis nibh. Nulla suscipit magna ultricies risus ultrices lobortis. Nunc pharetra nisi urna, cursus molestie enim pulvinar sed. In libero orci, porttitor vel risus sit amet, fermentum elementum leo. Nunc quis purus eget enim auctor mattis vitae ut arcu. Ut auctor sapien id nunc interdum, ac bibendum mauris consectetur. Vestibulum at tempor diam, sit amet consectetur libero. Vivamus ipsum sapien, gravida in augue sed, pulvinar finibus nunc. Suspendisse vulputate dapibus risus, sit amet pulvinar leo dapibus eget. Morbi eu blandit urna.  amet, consectetur adipiscing elit. Nulla feugiat enim orci, id rhoncus enim lacinia at. ",
                                    style: TextStyle(
                                        fontSize: 16.0, letterSpacing: 0.5),
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
