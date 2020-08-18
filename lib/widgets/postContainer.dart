import 'package:flutter/material.dart';
import 'package:poetry_blog_rebuild/models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        height: 100.0,
        decoration: new BoxDecoration(
            color: Colors.green, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
              bottomLeft: const Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0),
            )),
      ),
    );
  }
}
