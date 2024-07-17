import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_login/twitter_login.dart';

Future<UserCredential> signInWithTwitter() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final twitterLogin = TwitterLogin(
      apiKey: 'lm2KWPVGvRsDHrAB2pK2vvOKL',
      apiSecretKey: 'WHUUjoHlSCeTXxYiot196kS08FcRFLCJ3vSd5OStCNA4OE7YBL',
      redirectURI: 'com.example.flutterTwitterClone://auth');
  // 'https://twitter-clone-e3fa0.firebaseapp.com/__/auth/handler');
  final authResult = await twitterLogin.login();
  final twitterAuthCredential = TwitterAuthProvider.credential(
    accessToken: authResult.authToken!,
    secret: authResult.authTokenSecret!,
  );
  return await FirebaseAuth.instance
      .signInWithCredential(twitterAuthCredential);
}
