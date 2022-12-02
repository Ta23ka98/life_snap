import 'package:flutter/material.dart';
import 'package:life_snap/presentation/my_page/recertification_page.dart';

class MyPageTentative extends StatefulWidget {
  const MyPageTentative({super.key});

  @override
  State<MyPageTentative> createState() => _MyPageTentativeState();
}

class _MyPageTentativeState extends State<MyPageTentative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [SizedBox(height: 100), SegueProfile()],
      ),
    );
  }
}

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
    return Container(
      height: height / 8,
      width: width,
      color: Colors.white,
      child: Row(
        children: const [
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 30,
            child: Text('Avator'),
          ),
          SizedBox(
            width: 40,
          ),
          Text('example@gmail.com')
        ],
      ),
    );
  }
}

class SegueProfile extends StatefulWidget {
  const SegueProfile({super.key});

  @override
  State<SegueProfile> createState() => _SegueProfileState();
}

class _SegueProfileState extends State<SegueProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const ReCertificationPage())));
        },
        child: const Profile());
  }
}
