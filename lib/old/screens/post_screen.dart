import 'package:first_flutter/old/states/post_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';

class PostScreen extends ConsumerWidget{
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data from API"),),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) { 
            PostState postState = ref.watch(postsProvider);

            if(postState is PostInitialState){
              return const Text("Get the data");
            }

            if(postState is PostLoaingState){
              return const CircularProgressIndicator();
            }

            if(postState is PostErrorState){
              return Text("Error found: \n${postState.message} ");
            }

            if(postState is PostLoadedState){
              return _buildPostListView(postState);
            }

            return const Text("No data found");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postsProvider.notifier).fetchPosts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
  
  Widget _buildPostListView(PostLoadedState postState) {
    return ListView.builder(
      itemCount: postState.posts.length,
      itemBuilder: (context, index){
        Post post = postState.posts[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(post.id.toString()),
          ),
          title: Text(post.title),
        );
      }
    );
  }
  

}