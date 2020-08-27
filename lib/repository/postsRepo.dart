import 'package:http/http.dart' as http;
import 'package:poetry_blog_rebuild/models/models.dart';
import 'dart:convert';

Future<Stream<Post1>> getPosts1() async {
  final String url = 'http://poetry.musumbidenis.co.ke/api/posts';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Post1.fromJSON(data));
}
