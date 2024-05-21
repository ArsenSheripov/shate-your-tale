import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_your_tale/core/routes/page_name.dart';
import 'package:share_your_tale/features/auth/sign_in/presentation/sign_in_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
GoRouter getGoRouterConfig() => GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          name: PageName.signIn,
          path: '/',
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          name: PageName.signUp,
          path: '/signUp',
          builder: (context, state) => const SignInScreen(),
        ),
      ],
    );
