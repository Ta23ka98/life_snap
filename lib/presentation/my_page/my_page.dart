import 'package:flutter/material.dart';
import 'package:life_snap/presentation/my_page/recertification_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        children: const [
          Profile(),
          InfoList(
            icon: Icons.location_pin,
            text: "投稿一覧",
          ),
          InfoList(
            icon: Icons.favorite_border,
            text: "いいねした投稿",
          ),
          InfoList(
            icon: Icons.more_horiz,
            text: "アカウント管理",
          )
        ],
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
              Text(
                'user name',
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ));
  }
}

class InfoList extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoList({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return GestureDetector(
        onTap: () {
          //ページ遷移
        },
        child: SizedBox(
          height: height / 8,
          width: width,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ));
  }
}
