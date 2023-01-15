import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/auth_provider.dart';
import 'package:life_snap/presentation/check_post_page/vm/check_post_page_notifier.dart';
import 'package:life_snap/state/like_state/like_state.dart';

import '../widget/circular_widget.dart';

class CheckPostPage extends HookConsumerWidget {
  const CheckPostPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _postVm = ref.watch(checkPostPageNotifierProvider.notifier);
    final _likeVm = ref.watch(likeStateNotifierProvider.notifier);
    final _postState = ref.watch(checkPostPageNotifierProvider);
    final _likeState = ref.watch(likeStateNotifierProvider);
    final key = GlobalKey();
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    final _isLoading = useState<bool>(false);

    late String _uid;
    final _user = ref.read(userProvider);

    if (_user != null) {
      _uid = _user.uid;
    }

    late String _id;
    if (_postState.post!.postUserRef != null) {
      _id = _postState.post!.postUserRef!.id;
    } else {
      _id = "";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_postState.post!.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          key: key,
          child: Column(children: <Widget>[
            Container(
                height: height * 0.3,
                width: width * 1,
                color: Colors.black12,
                child: Image.network(
                  _postState.post!.postImageURL!,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        if (_likeState.isFavolit == false) {
                          await _likeVm.setLike(
                              uid: _uid, post: _postState.post!);
                          await _postVm.increment(
                              uid: _uid, post: _postState.post!);
                        } else {
                          await _likeVm.deleteLike(
                              uid: _uid, post: _postState.post!);
                          await _postVm.decrement(
                              uid: _uid, post: _postState.post!);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _likeState.isFavolit == true
                            ? Colors.pink
                            : Colors.white,
                        size: 40,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      _postState.post!.likeCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 36, 36, 36),
              height: height * 0.3,
              width: width * 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _postState.post!.content,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            _uid != _id
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 120,
                                  vertical: 10,
                                ),
                                elevation: 1.0,
                                backgroundColor: Colors.red,
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                _isLoading.value = true;
                                await _likeVm.deleteAll(
                                    id: _postState.post!.id);

                                await _postVm.deletePost(
                                    uid: _uid, post: _postState.post!);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                '削除する',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                ),
                              )),
                          if (_isLoading.value) const CircularWidget()
                        ]),
                  ),
          ]),
        ),
      ),
    );
  }
}
