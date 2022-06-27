// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
      var args = data.getArgs<CollectionsViewArguments>(
        orElse: () => CollectionsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CollectionsView(key: args.key),
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
      var args = data.getArgs<AddCollectionViewArguments>(
        orElse: () => AddCollectionViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCollectionView(key: args.key),
        settings: data,
      );
    },
    EditCollectionView: (data) {
      var args = data.getArgs<EditCollectionViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditCollectionView(
          key: args.key,
          collectionID: args.collectionID,
        ),
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
      var args = data.getArgs<ItemsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ItemsView(
          key: args.key,
          collectionID: args.collectionID,
        ),
        settings: data,
      );
    },
    AddItemView: (data) {
      var args = data.getArgs<AddItemViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddItemView(
          key: args.key,
          collectionID: args.collectionID,
        ),
        settings: data,
      );
    },
    EditItemView: (data) {
      var args = data.getArgs<EditItemViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditItemView(
          key: args.key,
          id: args.id,
        ),
        settings: data,
      );
    },
    ItemView: (data) {
      var args = data.getArgs<ItemViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ItemView(
          key: args.key,
          id: args.id,
        ),
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

/// CollectionsView arguments holder class
class CollectionsViewArguments {
  final Key? key;
  CollectionsViewArguments({this.key});
}

/// RegisterView arguments holder class
class RegisterViewArguments {
  final Key? key;
  RegisterViewArguments({this.key});
}

/// AddCollectionView arguments holder class
class AddCollectionViewArguments {
  final Key? key;
  AddCollectionViewArguments({this.key});
}

/// EditCollectionView arguments holder class
class EditCollectionViewArguments {
  final Key? key;
  final String collectionID;
  EditCollectionViewArguments({this.key, required this.collectionID});
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

/// ItemsView arguments holder class
class ItemsViewArguments {
  final Key? key;
  final String collectionID;
  ItemsViewArguments({this.key, required this.collectionID});
}

/// AddItemView arguments holder class
class AddItemViewArguments {
  final Key? key;
  final String collectionID;
  AddItemViewArguments({this.key, required this.collectionID});
}

/// EditItemView arguments holder class
class EditItemViewArguments {
  final Key? key;
  final String id;
  EditItemViewArguments({this.key, required this.id});
}

/// ItemView arguments holder class
class ItemViewArguments {
  final Key? key;
  final String id;
  ItemViewArguments({this.key, required this.id});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToStartUp({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startUp,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      arguments: LoginViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCollectionsView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.collectionsView,
      arguments: CollectionsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRegisterView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.registerView,
      arguments: RegisterViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddCollectionView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.addCollectionView,
      arguments: AddCollectionViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEditCollectionView({
    Key? key,
    required String collectionID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.editCollectionView,
      arguments:
          EditCollectionViewArguments(key: key, collectionID: collectionID),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEditProfileView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.editProfileView,
      arguments: EditProfileViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToResetPasswordView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.resetPasswordView,
      arguments: ResetPasswordViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToItemsView({
    Key? key,
    required String collectionID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.itemsView,
      arguments: ItemsViewArguments(key: key, collectionID: collectionID),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddItemView({
    Key? key,
    required String collectionID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.addItemView,
      arguments: AddItemViewArguments(key: key, collectionID: collectionID),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEditItemView({
    Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.editItemView,
      arguments: EditItemViewArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToItemView({
    Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.itemView,
      arguments: ItemViewArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
