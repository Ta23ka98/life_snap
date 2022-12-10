import 'package:flutter/material.dart';
import 'package:life_snap/presentation/my_page/recertification_page.dart';
import 'package:life_snap/presentation/post_confirmation_page/post_confirmation_page.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 43, 42, 42),
        appBar: AppBar(
          title: const Text('投稿一覧!'),
          backgroundColor: Colors.black,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                title: Profile(),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: height * 0.6,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "日本一の夜景！",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    const PostConfirmationPage()),
                              ),
                            )),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.network(
                            'https://www.knt.co.jp/image/japan_sandai_nightview_mv.jpg',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: isFavorite != false
                                      ? Colors.pink
                                      : Colors.white,
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
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}

// class PostListPage extends StatefulWidget {
//   const PostListPage({super.key});

//   @override
//   State<PostListPage> createState() => _PostListPageState();
// }

// class _PostListPageState extends State<PostListPage> {
//   @override
//   Widget build(BuildContext context) {
//     bool isFavorite = false;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 43, 42, 42),
//       appBar: AppBar(
//         title: const Text('投稿一覧'),
//         backgroundColor: Colors.black,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 50),
//           const Profile(),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 100,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         "リストNo",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: (() => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: ((context) =>
//                                   const PostConfirmationPage()),
//                             ),
//                           )),
//                       child: SizedBox(
//                         height: 200, // Widgetの高さを指定
//                         width: double.infinity,
//                         child: Image.network(
//                             'https://www.knt.co.jp/image/japan_sandai_nightview_mv.jpg'),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(24.0),
//                       child: Row(
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.favorite_border,
//                                 color: isFavorite != false
//                                     ? Colors.pink
//                                     : Colors.white,
//                               )),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           const Text(
//                             '1000',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               alignment: Alignment.centerRight,
//                               child: IconButton(
//                                 color: Colors.blue,
//                                 icon: const Icon(Icons.bookmark_border),
//                                 onPressed: () => {},
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Text(
//                       '吾輩は猫である。名前はまだ無い。どこで生まれたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 50),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const ReCertificationPage())));
        },
        child: Container(
          height: height / 7,
          width: 500,
          color: Colors.white,
          child: Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 30,
                child: Text('Avator'),
              ),
              Text('example@gmail.com')
            ],
          ),
        ));
  }
}
