import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/presentation/check_post_page/check_post_page_notifier.dart';

class CheckPostPage extends HookConsumerWidget {
  const CheckPostPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(checkPostPageNotifierProvider.notifier);
    final _post = ref.watch(checkPostPageNotifierProvider);
    final key = GlobalKey();
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    final isFavorite =
        useState<bool>(false); // 仮でboolで定義　いいねしたpostのIdと投稿のpostのIdの比較をする

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_post.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          key: key,
          child: Column(children: <Widget>[
            Container(
                height: height * 0.7,
                width: width * 0.9,
                color: Colors.black12,
                child: Image.network(
                  _post.postImageURL!,
                  fit: BoxFit.cover,
                )),
            Container(
              height: height * 0.21,
              width: width * 1,
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                //処理
                                if (isFavorite.value == false) {
                                  await _vm.increment(_post);
                                  isFavorite.value = true;
                                } else {
                                  await _vm.decrement(_post);
                                  isFavorite.value = false;
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: isFavorite.value == true
                                    ? Colors.pink
                                    : Colors.white,
                                size: 40,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              _post.likeCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                            onPressed: () {
                              //処理
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 40,
                            )),
                      )
                    ],
                  ),
                  Container(
                    color: const Color.fromARGB(255, 36, 36, 36),
                    height: height * 0.13,
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        _post.content,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
