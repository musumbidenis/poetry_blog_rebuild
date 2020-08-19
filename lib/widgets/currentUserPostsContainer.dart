import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/models/models.dart';

class CurrentUserPostsContainer extends StatelessWidget {
  final Post post;
  final User currentUser;

  const CurrentUserPostsContainer({Key key, this.post, this.currentUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: post.imageUrl,
            height: double.infinity,
            width: 150.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 150.0,
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
                radius: 15.0,
                backgroundImage: CachedNetworkImageProvider(post.user.imageUrl),
              ),
              SizedBox(
                width: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    post.timeAgo,
                    style: const TextStyle(
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