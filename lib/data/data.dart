import 'dart:convert';
import 'package:poetry_blog_rebuild/data/api.dart';
import 'package:poetry_blog_rebuild/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*Create a list array to store the fetched data*/
List<Post> posts = [];

/*Fetch the posts */
Stream getPosts() async* {
  var response = await CallAPi().getData('posts');
  var jsonData = json.decode(response.body);
  print(jsonData);

  /*Loop through the jsonData and add the items to the list array created*/
  for (var p in jsonData) {
    Post post = Post(
      p["postId"],
      p["title"],
      p["description"],
      p["imageUrl"],
      p["created_at"],
      p["username"],
    );

    posts.add(post);
  }
}

void getCurrentUser() async {
/*Retrieve the username of user from localStorage */
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var username = localStorage.getString('userKey');
}

final User currentUser = User(
  name: 'Marcus Ng',
  imageUrl:
      'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
);

Future refresh() async {
  var response = await CallAPi().getData('posts');
  var jsonData = json.decode(response.body);
  print(jsonData);

  /*Loop through the jsonData and add the items to the list array created*/
  for (var p in jsonData) {
    Post post = Post(
      p["postId"],
      p["title"],
      p["description"],
      p["imageUrl"],
      p["created_at"],
      p["username"],
    );

    posts.add(post);
  }

  return posts;
}
