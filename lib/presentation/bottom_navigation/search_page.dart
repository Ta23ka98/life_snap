import 'package:flutter/material.dart';
import 'package:life_snap/presentation/bottom_navigation/tab_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.search.title;

    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: Center(),
    );
  }
}
