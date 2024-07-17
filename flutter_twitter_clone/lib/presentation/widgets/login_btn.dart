import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_clone/business_logic/blocs/auth_bloc.dart';
import 'package:flutter_twitter_clone/services/api_services.dart';
import 'package:go_router/go_router.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  SignInButtonState createState() => SignInButtonState();
}

class SignInButtonState extends State<SignInButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return !isLoading
        ? SizedBox(
            width: size.width * 0.8,
            child: OutlinedButton.icon(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blue[400]),
              label: const Text(
                'Login with Twitter',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                var twitterResponse = await signInWithTwitter();
                print(twitterResponse);
                setState(() {
                  isLoading = false;
                  context.pushReplacement('/home');
                });
              },
            ),
          )
        : const CircularProgressIndicator();
  }
}
