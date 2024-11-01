import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wc_services/wc_services.dart';

import '../pages/pages.dart';

/// 账号相关路由
class AccountPageRouter {
  AccountPageRouter() {
    final account = GoRoute(
      name: RouterPath.account.name,
      path: RouterPath.account.fullPath,
      builder: (_, s) => const AccountActivatePage(),
      routes: [
        GoRoute(
          name: RouterPath.login.name,
          path: RouterPath.login.path,
          pageBuilder: (_, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const LoginPage(),
              fullscreenDialog: true,
            );
          },
        ),
        GoRoute(
          name: RouterPath.chooseCountry.name,
          path: RouterPath.chooseCountry.path,
          pageBuilder: (_, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const ChooseCountryPage(),
              fullscreenDialog: true,
            );
          },
        ),
      ],
    );
    routes = [account];
  }

  late final List<GoRoute> routes;
}
