import 'package:go_router/go_router.dart';
import 'package:wc_account/router/index.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: AccountPageRouter().routes,
  );
}
