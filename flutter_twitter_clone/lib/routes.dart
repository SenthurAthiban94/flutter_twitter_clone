// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/presentation/screens/login_screen.dart';
import 'package:flutter_twitter_clone/presentation/screens/splash_screen.dart';
import 'package:flutter_twitter_clone/presentation/screens/home_screen.dart';
import 'package:flutter_twitter_clone/presentation/screens/tweet_screen.dart';
import 'package:flutter_twitter_clone/presentation/screens/error_screen.dart';
import 'package:flutter_twitter_clone/presentation/screens/tweet_details_screen.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter twitterRoutes = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        name: 'app',
        builder: (context, state) => const SplashScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (context, state) => const Loginscreen(),
          ),
          GoRoute(
            path: 'home',
            name: 'home',
            builder: (context, state) => const Homescreen(),
          ),
          GoRoute(
              path: 'tweet',
              name: 'tweet',
              redirect: (context, state) => "/tweet/create",
              routes: <RouteBase>[
                GoRoute(
                    path: 'create',
                    name: 'create-post',
                    builder: (context, state) => const Tweetscreen()),
                GoRoute(
                    path: 'edit/:tweet_id',
                    name: 'edit-post',
                    builder: (context, state) {
                      // final fid = state.params['fid']!;
                      // final family = Families.data.firstWhere((f) => f.id == fid,
                      //     orElse: () => throw Exception('family not found: $fid'));
                      return const Tweetscreen();
                    }),
                GoRoute(
                    path: 'view/:tweet_id',
                    name: 'view-post',
                    builder: (context, state) => const TweetDetailscreen())
              ])
        ]),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
