import 'package:go_router/go_router.dart';
import '../mods/login/ui/login_homepage.dart';
import '../mods/activity/view/activity.dart';
import 'meta.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home.name,
      redirect: (context, state) => '/activity',
    ),
    GoRoute(
        path: '/activity',
        name: Routes.activity.name,
        builder: (context, state) => const Activity()),
    GoRoute(
        path: '/login',
        name: Routes.login.home.name,
        builder: (context, state) => const LoginHomepage()),
  ],
);
