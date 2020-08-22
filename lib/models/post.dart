import 'package:poetry_blog_rebuild/models/user.dart';

class Post {
  final String postId;
  final String title;
  final String username;
  final String description;
  final String imageUrl;
  final String created_at;

  Post(this.postId, this.title, this.description, this.imageUrl,
      this.created_at, this.username);
}
