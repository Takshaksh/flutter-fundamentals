import 'package:first_flutter/old/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';

// Defining the Riverpod provider
final postsProvider = StateNotifierProvider<PostNotifier, PostState>((ref) => PostNotifier());

@immutable
abstract class PostState{}

class PostInitialState extends PostState{}

class PostLoaingState extends PostState{}

class PostLoadedState extends PostState{
  final List<Post> posts;
  PostLoadedState({ required this.posts });
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState({ required this.message });
}

// Riverpod notifier

class PostNotifier extends StateNotifier<PostState>{
  PostNotifier(): super(PostInitialState());

  final HttpService _httpService = HttpService();

  void fetchPosts() async{
    try {
      state = PostLoaingState();
      List<Post> posts = await _httpService.getPosts();
      state = PostLoadedState(posts: posts);  
    } catch (e) {
      state = PostErrorState(message: e.toString());
    }
  }
}