import 'package:flutter/material.dart';

class UserLikeCheckPage extends StatelessWidget {
  final String title;
  final String imageURL;
  final int favCount;
  final String text;
  const UserLikeCheckPage({
    super.key,
    required this.title,
    required this.imageURL,
    required this.favCount,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("いいねした投稿"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: height,
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
                    image: NetworkImage(
                        "https://www.bing.com/th?id=OIP.NGeQUv4Bg5uJOljwF0b_ggHaFj&w=176&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
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
              height: height * 0.5,
              width: width * 0.8,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
