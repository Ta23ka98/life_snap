import 'package:flutter/material.dart';
import 'package:life_snap/presentation/acount_management_page/recertification_page.dart';
import 'package:life_snap/presentation/my_page/my_page.dart';

class AcountManagementPage extends StatelessWidget {
  const AcountManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const ReCertificationPage())));
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

// class SegueProfile extends StatefulWidget {
//   const SegueProfile({super.key});

//   @override
//   State<SegueProfile> createState() => _SegueProfileState();
// }

// class _SegueProfileState extends State<SegueProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: ((context) => const ReCertificationPage())));
//         },
//         child: const Profile());
//   }
// }
