part of '../app_configs.dart';

class RouteConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final routerConfig = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => ProductsPage(),
      ),
      GoRoute(
        path: RoutePaths.productDetail,
        builder: (context, state) => ProductDetail(),
      ),
      GoRoute(path: RoutePaths.cart, builder: (context, state) => CartPage()),
    ],
  );
}
