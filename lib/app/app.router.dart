// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/auth_flow_views/login.dart';
import '../views/auth_flow_views/register.dart';
import '../views/collections/collections.dart';
import '../views/startup/startup.dart';

class Routes {
  static const String startUp = '/';
  static const String loginView = '/login-view';
  static const String collectionsView = '/collections-view';
  static const String registerView = '/register-view';
  static const all = <String>{
    startUp,
    loginView,
    collectionsView,
    registerView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUp, page: StartUp),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.collectionsView, page: CollectionsView),
    RouteDef(Routes.registerView, page: RegisterView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUp: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUp(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    CollectionsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CollectionsView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RegisterView(),
        settings: data,
      );
    },
  };
}
