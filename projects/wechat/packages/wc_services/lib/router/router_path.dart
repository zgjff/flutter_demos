part 'router_path_item.dart';

/// 路由路径
class RouterPath {
  /// 起始路由
  static const index =
      RouterPathItem(name: 'index', parentPath: null, path: '/');

  /// 登录注册启动页面
  static const account =
      RouterPathItem(name: 'account', parentPath: null, path: '/account');

  /// 手机号登录
  static const phoneLogin = RouterPathItem(
      name: 'account_login_phone', parentPath: '/account', path: 'login/phone');

  /// 主app tab
  static const appTab = "/tab";
}
