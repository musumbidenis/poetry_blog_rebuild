import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 15.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        height: 300.0,
        decoration: new BoxDecoration(
            color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[800],
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: post.imageUrl,
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned(
                  //   child: CircleAvatar(
                  //     radius: 30.0,
                  //     backgroundImage:
                  //         CachedNetworkImageProvider(post.user.imageUrl),
                  //   ),
                  //   right: 20.0,
                  //   bottom: -25,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                post.caption,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                        Text(post.likes.toString())
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
                        Text(post.comments.toString())
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
