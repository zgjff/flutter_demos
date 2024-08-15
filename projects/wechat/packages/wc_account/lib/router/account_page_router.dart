import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wc_account/pages/login/phone_login_page.dart';
import 'package:wc_services/router/index.dart';

import '../pages/index.dart';

/// 账号相关路由
class AccountPageRouter {
  AccountPageRouter() {
    final account = GoRoute(
      name: RouterPath.login.name,
      path: RouterPath.login.fullPath,
      builder: (_, s) => const AccountActivatePage(),
      routes: [
        GoRoute(
          name: RouterPath.phoneLogin.name,
          path: RouterPath.phoneLogin.path,
          pageBuilder: (_, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const PhoneLoginPage(),
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
