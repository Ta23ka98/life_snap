import 'package:flutter/material.dart';
import 'package:life_snap/presentation/my_page/my_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../first_page/first_page.dart';

class ReCertificationPage extends StatefulWidget {
  const ReCertificationPage({super.key});

  @override
  State<ReCertificationPage> createState() => _ReCertificationPageState();
}

class _ReCertificationPageState extends State<ReCertificationPage> {
  void deleteUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email;
    final AuthCredential credential = EmailAuthProvider.credential(
        email: email.toString(), password: password);
    try {
      await user!.reauthenticateWithCredential(credential);
      // ignore: avoid_print
      print('再認証成功');
      await user.delete();
      await FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously

      // ignore: avoid_print
      print('ユーザーの削除完了');
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      // ignore: avoid_print
      print('再認証が必要です');
    }
  }

  String password = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 89, 86, 86),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, //タッチ動作を検知する。
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Profile(),
              const SizedBox(height: 130),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'パスワード',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0)),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              SizedBox(
                width: width - 30,
                height: 70,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0)))),
                    onPressed: (() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              insetPadding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              titlePadding: const EdgeInsets.only(top: 100),
                              content: SizedBox(
                                width: width - 100,
                                height: height / 5,
                              ),
                              buttonPadding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0))),
                              title: const Center(
                                  child: Text(
                                '本当に削除しますか?',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              )),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      width: (width - 100) / 2,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  0)))),
                                          onPressed: (() async {
                                            deleteUser();
                                          }),
                                          child: const Text('削除する')),
                                    ),
                                    SizedBox(
                                      height: 70,
                                      width: (width - 100) / 2,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  0)))),
                                          onPressed: (() {}),
                                          child: const Text(
                                            'しない',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    }),
                    child: const Text('アカウントを削除する')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
