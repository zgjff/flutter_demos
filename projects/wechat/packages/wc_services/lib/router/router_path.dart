part 'router_path_item.dart';

/// 路由路径
class RouterPath {
  /// 起始路由
  static const index =
      RouterPathItem(name: 'app_index', parentPath: null, path: '/');

  /// 启动页面
  static const launch =
      RouterPathItem(name: 'app_launch', parentPath: null, path: '/launch');

  /// 登录注册启动页面
  static const login =
      RouterPathItem(name: 'app_login', parentPath: null, path: '/login');

  /// 手机号登录
  static const phoneLogin = RouterPathItem(
      name: 'app_login_phone', parentPath: '/login', path: 'phone');

  /// 主app tab
  static const appTab = "/tab";
}
