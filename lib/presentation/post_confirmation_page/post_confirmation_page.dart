import 'package:flutter/material.dart';

class PostConfirmationPage extends StatelessWidget {
  const PostConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 42, 42),
      appBar: AppBar(
        title: const Text('投稿の確認'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('日本一の夜景！',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 200, // Widgetの高さを指定
                width: double.infinity,
                child: Image.network(
                    'https://www.knt.co.jp/image/japan_sandai_nightview_mv.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color:
                              isFavorite != false ? Colors.pink : Colors.white,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '1000',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          color: Colors.blue,
                          icon: const Icon(Icons.bookmark_border),
                          onPressed: () => {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '吾輩は猫である。名前はまだ無い。どこで生まれたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    '削除する',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
