import 'package:flutter/material.dart';

class TweetDetailscreen extends StatefulWidget {
  const TweetDetailscreen({super.key});

  @override
  State<TweetDetailscreen> createState() => _TweetDetailscreenState();
}

class _TweetDetailscreenState extends State<TweetDetailscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Tweet Details screen")),
    );
  }
}
