import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckPostPage extends ConsumerWidget {
  // とりあえずConsumer化
  final String title;
  final String imageURL;
  final int countNum;
  final String explainText;
  const CheckPostPage(
      {super.key,
      required this.title,
      required this.imageURL,
      required this.countNum,
      required this.explainText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = GlobalKey();
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        key: key,
        child: Column(children: <Widget>[
          Container(
              height: height * 0.7,
              width: width * 0.9,
              color: Colors.black12,
              child: Image.network(
                imageURL,
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
                            onPressed: () {
                              //処理
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 40.0,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            countNum.toString(),
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
                      explainText,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
