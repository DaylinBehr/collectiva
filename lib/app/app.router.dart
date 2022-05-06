// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/account/account_management.dart';
import '../views/auth_flow_views/login.dart';
import '../views/auth_flow_views/register.dart';
import '../views/collections/collections.dart';
import '../views/collections_add_collection/collections_add_collections.dart';
import '../views/collections_edit_collection/collections_edit_collections.dart';
import '../views/items/items.dart';
import '../views/items_add_item/items_add_item.dart';
import '../views/items_edit_item/items_edit_item.dart';
import '../views/items_view_item/items_view_item.dart';
import '../views/startup/startup.dart';

class Routes {
  static const String startUp = '/';
  static const String loginView = '/login-view';
  static const String collectionsView = '/collections-view';
  static const String registerView = '/register-view';
  static const String addCollectionView = '/add-collection-view';
  static const String editCollectionView = '/edit-collection-view';
  static const String editProfileView = '/edit-profile-view';
  static const String resetPasswordView = '/reset-password-view';
  static const String itemsView = '/items-view';
  static const String addItemView = '/add-item-view';
  static const String editItemView = '/edit-item-view';
  static const String itemView = '/item-view';
  static const all = <String>{
    startUp,
    loginView,
    collectionsView,
    registerView,
    addCollectionView,
    editCollectionView,
    editProfileView,
    resetPasswordView,
    itemsView,
    addItemView,
    editItemView,
    itemView,
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
    RouteDef(Routes.addCollectionView, page: AddCollectionView),
    RouteDef(Routes.editCollectionView, page: EditCollectionView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.itemsView, page: ItemsView),
    RouteDef(Routes.addItemView, page: AddItemView),
    RouteDef(Routes.editItemView, page: EditItemView),
    RouteDef(Routes.itemView, page: ItemView),
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
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
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
      var args = data.getArgs<RegisterViewArguments>(
        orElse: () => RegisterViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(key: args.key),
        settings: data,
      );
    },
    AddCollectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddCollectionView(),
        settings: data,
      );
    },
    EditCollectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditCollectionView(),
        settings: data,
      );
    },
    EditProfileView: (data) {
      var args = data.getArgs<EditProfileViewArguments>(
        orElse: () => EditProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditProfileView(key: args.key),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      var args = data.getArgs<ResetPasswordViewArguments>(
        orElse: () => ResetPasswordViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResetPasswordView(key: args.key),
        settings: data,
      );
    },
    ItemsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ItemsView(),
        settings: data,
      );
    },
    AddItemView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddItemView(),
        settings: data,
      );
    },
    EditItemView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditItemView(),
        settings: data,
      );
    },
    ItemView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ItemView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// RegisterView arguments holder class
class RegisterViewArguments {
  final Key? key;
  RegisterViewArguments({this.key});
}

/// EditProfileView arguments holder class
class EditProfileViewArguments {
  final Key? key;
  EditProfileViewArguments({this.key});
}

/// ResetPasswordView arguments holder class
class ResetPasswordViewArguments {
  final Key? key;
  ResetPasswordViewArguments({this.key});
}
