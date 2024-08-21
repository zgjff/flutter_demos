part of 'router_path.dart';

class RouterPathItem {
  /// 路由名称
  final String? name;

  /// 作为子路由时,父路由的路径
  final String? parentPath;

  /// 如果是子路由,则是父路由下面自身的path;否则是全路径
  /// 一般在创建`GoRoute`的时候使用; 如果是想通过路由访问,请使用`fullPath`
  final String path;

  /// 全路径
  /// 一般是作为路由访问时使用
  final String fullPath;

  const RouterPathItem({
    this.name,
    this.parentPath,
    required this.path,
  }) : fullPath = parentPath == null ? path : '$parentPath/$path';
}
