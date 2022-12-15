import 'package:flutter/material.dart';
import 'package:life_snap/presentation/user_like_page/user_like_check_page.dart';

class UserLikeListPage extends StatefulWidget {
  const UserLikeListPage({super.key});

  @override
  State<UserLikeListPage> createState() => _UserLikeListPageState();
}

class _UserLikeListPageState extends State<UserLikeListPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    const String imageURL =
        "https://www.bing.com/th?id=OIP.NGeQUv4Bg5uJOljwF0b_ggHaFj&w=176&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2";
    const String text =
        "朝起きると、まずは目の前の川に飛び込む。その後はキャンプファイヤーをしながらTwitterを開こうとすると圏外なので、もう一度川に入って忘れることにする。\nその後は車で街までドライブし、戻ってきてから魚を釣って夕食にする。";
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("いいねした投稿"),
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
          builder: (context, snapshot) {
            return ListView(shrinkWrap: true, children: <Widget>[
              for (int i = 0; i < 5; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return const UserLikeCheckPage(
                              title: "モーニングルーティン",
                              imageURL: imageURL,
                              favCount: 74,
                              text: text);
                        }),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.45,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 36, 36, 36),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: width,
                          child: const Text(
                            "モーニング・ルーティン",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: height * 0.3,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageURL),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              ),
                            ),
                            const Text(
                              "74",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.069,
                          width: width * 0.8,
                          child: const Text(
                            text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ]);
          },
        ));
  }
}
