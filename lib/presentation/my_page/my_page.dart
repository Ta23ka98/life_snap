import 'package:flutter/material.dart';

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
        children: const [SizedBox(height: 100), Profile()],
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
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Segue())));
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
              Text('example@gmail.com')
            ],
          ),
        ));
  }
}

class Segue extends StatefulWidget {
  const Segue({super.key});

  @override
  State<Segue> createState() => _SegueState();
}

class _SegueState extends State<Segue> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('遷移先'),
    );
  }
}
