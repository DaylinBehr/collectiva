import 'package:collectiva/views/account/account_management.dart';
import 'package:collectiva/views/auth_flow_views/login.dart';
import 'package:collectiva/views/auth_flow_views/register.dart';
import 'package:collectiva/views/collections/collections.dart';
import 'package:collectiva/views/collections_add_collection/collections_add_collections.dart';
import 'package:collectiva/views/items/items.dart';
import 'package:collectiva/views/items_add_item/items_add_item.dart';
import 'package:collectiva/views/items_edit_item/items_edit_item.dart';
import 'package:collectiva/views/startup/startup.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../services/authentication_service.dart';
import '../services/firestore_service.dart';
import '../views/collections_edit_collection/collections_edit_collections.dart';
import '../views/items_view_item/items_view_item.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUp, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: CollectionsView),
  MaterialRoute(page: RegisterView),
  MaterialRoute(page: AddCollectionView),
  MaterialRoute(page: EditCollectionView),
  MaterialRoute(page: EditProfileView),
  MaterialRoute(page: ResetPasswordView),
  MaterialRoute(page: ItemsView),
  MaterialRoute(page: AddItemView),
  MaterialRoute(page: EditItemView),
  MaterialRoute(page: ItemView),
], dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: AuthService),
  LazySingleton(classType: FireStoreService),
  LazySingleton(
      classType: ThemeService, resolveUsing: ThemeService.getInstance),
])
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
