import 'package:flutter/material.dart';
import 'package:life_snap/presentation/bottom_navigation/tab_item.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.mypage.title;

    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: Center(
        child: Column(),
      ),
    );
  }
}
