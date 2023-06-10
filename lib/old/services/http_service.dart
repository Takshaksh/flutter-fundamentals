import 'dart:convert' as converter;
import 'dart:developer';
import 'package:first_flutter/old/models/post.dart';
import 'package:http/http.dart' as http;

class HttpService{
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const _postEndpoint = '/posts';

  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try{
      Uri postsUri = Uri.parse('$_baseUrl$_postEndpoint');
      http.Response response =  await http.get(postsUri);

      if(response.statusCode == 200){
        List<dynamic> postList = converter.jsonDecode(response.body);
        for (var postItem in postList) {
          posts.add(Post.fromMap(postItem)); 
        }
      }
    }catch (e){
      log(e.toString());
    }

    return posts;
  }
}