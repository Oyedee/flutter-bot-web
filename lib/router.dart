import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kada_bot_web/src/features/auth/views/sign_up_page.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');

// http://localhost:8080/accountlinkage/08135669272/78766/WhatsApp/54/76/OXBEb3JRVFVoU3o1VXhDNlVsMG11aCtZcUQ2aWFrakhGQ3p4bnV0c09sQT0=

final goRouterProvider = Provider((ref) => GoRouter(
      navigatorKey: _rootNavigator,
      initialLocation: '/',
      debugLogDiagnostics: true,
      redirect: (context, state) {
        if (true) {
          return '/accountlinkage/:botNumber/:botId/WhatsApp/:schoolId/:classId/:botToken';
        }
      },
      routes: [
        GoRoute(
          name: SignUpPage.routeName,
          path: '/accountlinkage/:botNumber/:botId/WhatsApp/:schoolId/:classId/:botToken',
          builder: (context, state) {
            final botNumber = state.pathParameters['botNumber']!;
            final botId = state.pathParameters['botId']!;
            final schoolId = state.pathParameters['schoolId']!;
            final classId = state.pathParameters['classId']!;
            final botToken = state.pathParameters['botToken']!;
            log('botNumber: $botNumber');
            log('botId: $botId');
            log('schoolId: $schoolId');
            return SignUpPage(key: state.pageKey);
          },
        ),
      ],
      errorPageBuilder: (context, state) => const MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      ),
    ));
