class Post1 {
  final int postid;
  final String title, username, description, imageUrl, created_at;

  Post1.fromJSON(Map<String, dynamic> jsonMap)
      : postid = jsonMap['id'],
        title = jsonMap['title'],
        username = jsonMap['username'],
        description = jsonMap['description'],
        imageUrl = jsonMap['imageUrl'],
        created_at = jsonMap['created_at'];
}
