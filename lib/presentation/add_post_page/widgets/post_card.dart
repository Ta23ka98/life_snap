import 'package:flutter/material.dart';
import 'package:life_snap/presentation/check_post_page/check_post_page.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const String imgURL =
        "https://th.bing.com/th/id/OIP.CDTod_XisCc2Yo-Ww8VcZQHaNL?w=115&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7";
    bool isFavorite = false;

    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const CheckPostPage(
                    title: "投稿の説明",
                    imageURL: imgURL,
                    countNum: 35,
                    explainText: "にゃんにゃんにゃんにゃんにゃんにゃんにゃんにゃんにゃん",
                  )),
            ),
          )),
      child: Container(
        width: size.width * 0.5, //サイズはとりあえず
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Column(
          children: [
            const Center(
                child: Text(
              "投稿の説明",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            SizedBox(
              width: double.infinity,
              height: size.height * 0.3,
              child: Image.network(
                imgURL,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //IconButtonじゃなくてInkWillでもいいかも
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = true;
                            Icon(
                              Icons.favorite_border,
                              color: isFavorite != false
                                  ? Colors.pink
                                  : Colors.white,
                            );
                          });
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color:
                              isFavorite != false ? Colors.pink : Colors.white,
                        )),
                    const Text(
                      "35",
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
            Container(
              padding: const EdgeInsets.all(5.0),
              height: size.height * 0.08,
              child: const Flexible(
                  //自動改行

                  child: Text(
                "にゃんにゃんにゃんにゃんにゃんにゃんにゃんにゃんにゃん",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 3,
              )),
            )
          ],
        ),
      ),
    );
  }
}
