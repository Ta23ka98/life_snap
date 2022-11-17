import 'package:flutter/material.dart';
import 'package:life_snap/presentation/bottom_navigation/my_page.dart';
import 'package:life_snap/presentation/bottom_navigation/search_page.dart';

enum TabItem {
  search(
    title: '探す',
    icon: Icons.search,
    page: SearchPage(),
  ),

  mypage(
    title: 'マイページ',
    icon: Icons.person,
    page: MyPage(),
  );

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}
