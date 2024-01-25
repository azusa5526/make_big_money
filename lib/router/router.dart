import 'package:go_router/go_router.dart';
import '../mods/login/ui/login_homepage.dart';
import 'meta.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home.name,
      redirect: (context, state) => '/login',
    ),
    GoRoute(
        path: '/login',
        name: Routes.login.home.name,
        builder: (context, state) => const LoginHomepage()),
  ],
);
