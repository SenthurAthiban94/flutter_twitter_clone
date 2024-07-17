import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_clone/business_logic/blocs/auth_bloc.dart';
import 'package:flutter_twitter_clone/data/models/Tweet.dart';
import 'package:flutter_twitter_clone/presentation/widgets/tweet_card.dart';
import 'package:flutter_twitter_clone/services/api_services.dart';
import 'package:go_router/go_router.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  // Widget build(BuildContext context) {
  //   final authBloc = BlocProvider.of<AuthBloc>(context);
  //   return Scaffold(
  //     body: Center(
  //       child: OutlinedButton.const icon(
  //           label: const Text('Home'),
  //           onPressed: () async {
  //             var twitterResponse = await signInWithTwitter();
  //             print(twitterResponse.toString());
  //             // String? token = await authBloc.getToken();
  //             // print('Token from AuthBloc: $token');
  //           }),
  //     ),
  //   );
  // }
  final List<Tweet> tweets = [
    Tweet(
      userName: 'John Doe',
      userHandle: '@johndoe',
      profileImageUrl: 'https://via.placeholder.com/150',
      tweetText:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed lectus sed neque hendrerit iaculis.',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Tweet(
      userName: 'Jane Smith',
      userHandle: '@janesmith',
      profileImageUrl: 'https://via.placeholder.com/150',
      tweetText: 'Hello world! #flutter #twitter',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    // Add more tweets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Image.asset(
          'assets/icons/logo.png',
          width: 50,
          height: 50,
        ),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return TweetCard(tweet: tweets[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.blue[400],
        onPressed: () {
          context.push('/tweet');
          // Handle new tweet action
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
