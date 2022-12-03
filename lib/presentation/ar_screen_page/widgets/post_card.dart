import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/presentation/check_post_page/check_post_page.dart';
import 'package:life_snap/presentation/check_post_page/check_post_page_notifier.dart';
import 'package:life_snap/state/annotation_state/annotation.dart';
import 'package:life_snap/state/like_state/like_state.dart';

class PostCard extends HookConsumerWidget {
  const PostCard({super.key, required this.annotation});
  final Annotation annotation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _postVm = ref.watch(checkPostPageNotifierProvider.notifier);
    final _likeVm = ref.watch(likeStateNotifierProvider.notifier);
    final _post = ref.watch(checkPostPageNotifierProvider);
    final _likeState = ref.watch(likeStateNotifierProvider);
    final Size size = MediaQuery.of(context).size;

    useEffect(() {
      Future(() async {
        await _postVm.setPost(annotation.post);
        await _likeVm.isLikes(post: annotation.post);
      });
      return null;
    }, [annotation.post]);

    return GestureDetector(
      onTap: (() => Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const CheckPostPage())))),
      child: Container(
        width: size.width * 0.5, //サイズはとりあえず
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Column(
          children: [
            Center(
                child: Text(
              _post.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )),
            _post.postImageURL != null
                ? SizedBox(
                    width: double.infinity,
                    height: size.height * 0.3,
                    child: Image.network(
                      _post.postImageURL!,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //IconButtonじゃなくてInkWillでもいいかも
                    IconButton(
                        onPressed: () {
                          // isFavorite.value == true ? false : true;
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: _likeState.isFavolit == true
                              ? Colors.pink
                              : Colors.white,
                        )),
                    Text(
                      "${_post.likeCount}",
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
