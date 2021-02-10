import 'package:amanokerim/models/post.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.post);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(post.body),
      ),
    );
  }
}
