import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/auth_provider.dart';
import 'package:life_snap/presentation/user_like_page/vm/user_like_page_notifier.dart';
import 'package:life_snap/presentation/user_like_page/widget/user_like_check_page.dart';
import 'package:life_snap/state/like_state/like_state.dart';

class UserLikeListPage extends HookConsumerWidget {
  const UserLikeListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(userLikePageNotifierProvider.notifier);
    final _postList = ref.watch(userLikePageNotifierProvider).posts;

    late String _uid;
    final _user = ref.read(userProvider);

    if (_user != null) {
      _uid = _user.uid;
    }

    useEffect(() {
      Future(() async {
        await _vm.getMyLikePost(uid: _uid);
      });

      return null;
    }, [_postList]);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("いいねした投稿"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: _postList != []
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: _postList.length,
                  itemBuilder: ((context, index) {
                    final _post = _postList[index];
                    final _likeVm =
                        ref.watch(likeStateNotifierProvider.notifier);
                    final _likeState = ref.watch(likeStateNotifierProvider);
                    return _post != null
                        ? FutureBuilder(
                            future: _likeVm.isLikes(uid: _uid, post: _post),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 36, 36, 36),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              child: Text(
                                                _post.title,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            _post.postImageURL != null
                                                ? GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  ((context) {
                                                        return UserLikeCheckPage(
                                                          post: _post,
                                                        );
                                                      })));
                                                    },
                                                    child: Image.network(
                                                      _post.postImageURL!,
                                                      width: double.infinity,
                                                      height: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Container(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (_likeState
                                                              .isFavolit ==
                                                          false) {
                                                        await _likeVm.setLike(
                                                            uid: _uid,
                                                            post: _post);
                                                        await _vm.increment(
                                                            uid: _uid,
                                                            post: _post);
                                                      } else {
                                                        await _likeVm
                                                            .deleteLike(
                                                                uid: _uid,
                                                                post: _post);
                                                        await _vm.decrement(
                                                            uid: _uid,
                                                            post: _post);
                                                      }
                                                    },
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: _likeState
                                                                  .isFavolit ==
                                                              true
                                                          ? Colors.pink
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${_post.likeCount}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 100,
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                _post.content,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    height: 0,
                                    color: Colors.white,
                                  ),
                                ],
                              );
                            })
                        : Container();
                  }),
                )
              : Container(),
        )));
  }
}
