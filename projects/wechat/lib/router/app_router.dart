import 'package:go_router/go_router.dart';
import 'package:wc_account/wc_account.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/account',
    routes: AccountPageRouter().routes,
  );
}
