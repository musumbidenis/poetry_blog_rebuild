import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poetry_blog_rebuild/models/models.dart';

class Trending extends StatelessWidget {
  final List<Post> posts;

  const Trending({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 20.0, bottom: 5.0),
          child: Text(
            "Trending",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Container(
            height: 200.0,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 8.0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: _PostCard(
                      post: posts[index],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class _PostCard extends StatelessWidget {
  final Post post;

  const _PostCard({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: post.imageUrl,
            height: double.infinity,
            width: 120.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 120.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Row(
            children: [
              CircleAvatar(
                radius: 10.0,
                backgroundImage: CachedNetworkImageProvider(post.user.imageUrl),
              ),
              SizedBox(
                width: 3.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.user.name,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    post.timeAgo,
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
