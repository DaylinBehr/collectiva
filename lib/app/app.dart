import 'package:collectiva/views/auth_flow_views/login.dart';
import 'package:collectiva/views/auth_flow_views/register.dart';
import 'package:collectiva/views/collections/collections.dart';
import 'package:collectiva/views/startup/startup.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../services/authentication_service.dart';
import '../services/firestore_service.dart';

@StackedApp(

    routes: [
      MaterialRoute(page: StartUp, initial: true),
    MaterialRoute(page: LoginView),
      MaterialRoute(page: CollectionsView),
    MaterialRoute(page: RegisterView)
    // MaterialRoute(page: HomeView, initial: true),
],dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: AuthService),
  LazySingleton(classType: FireStoreService),
  LazySingleton(
      classType: ThemeService, resolveUsing: ThemeService.getInstance),
]
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}