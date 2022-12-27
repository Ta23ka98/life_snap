import 'package:flutter/material.dart';
import 'package:life_snap/domain/entity/post/post.dart';

class UserLikeCheckPage extends StatelessWidget {
  const UserLikeCheckPage({
    super.key,
    required this.post,
  });
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("いいねした投稿"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  post.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              post.postImageURL != null
                  ? Image.network(
                      post.postImageURL!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     IconButton(
              //       onPressed: () async {},
              //       icon: const Icon(Icons.favorite, color: Colors.pink),
              //     ),
              //     Text(
              //       "${post.likeCount}",
              //       style: const TextStyle(color: Colors.white),
              //     ),
              //   ],
              // ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Text(
                  post.content,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ])));
  }
}
