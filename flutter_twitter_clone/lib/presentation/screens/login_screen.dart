import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/presentation/widgets/login_btn.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/logo.png',
            width: 80,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: SignInButton(),
          )
        ],
      )),
    );
  }
}
