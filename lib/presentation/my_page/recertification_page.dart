import 'package:flutter/material.dart';
import 'package:life_snap/presentation/my_page/my_page.dart';

class ReCertificationPage extends StatefulWidget {
  const ReCertificationPage({super.key});

  @override
  State<ReCertificationPage> createState() => _ReCertificationPageState();
}

class _ReCertificationPageState extends State<ReCertificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Profile(),
          Text(''),
          TextFormField(),
          ElevatedButton(onPressed: (() {}), child: Text('アカウントを削除する'))
        ],
      ),
    );
  }
}
