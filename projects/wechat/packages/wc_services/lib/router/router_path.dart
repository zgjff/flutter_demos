part 'router_path_item.dart';

/// 路由路径
class RouterPath {
  /// 起始路由
  static const index =
      RouterPathItem(name: 'index', parentPath: null, path: '/');

  /// 登录注册启动页面
  static const login =
      RouterPathItem(name: 'login', parentPath: null, path: '/login');

  /// 手机号登录
  static const phoneLogin =
      RouterPathItem(name: 'login_phone', parentPath: '/login', path: 'phone');

  /// 主app tab
  static const appTab = "/tab";
}
