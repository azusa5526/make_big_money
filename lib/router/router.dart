import 'package:flutter_iflood/mods/activity/view/activity_add.dart';
import 'package:flutter_iflood/utils/console.dart';
import 'package:go_router/go_router.dart';
import '../mods/login/ui/login_homepage.dart';
import '../mods/activity/view/activity_home.dart';
import '../mods/activity/view/activity_edit.dart';
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
      name: Routes.activity.home.name,
      builder: (context, state) => const ActivityHome(),
      routes: [
        GoRoute(
          path: 'add',
          name: Routes.activity.add.name,
          builder: (context, state) => const ActivityAdd(),
        ),
        GoRoute(
          path: 'edit',
          name: Routes.activity.edit.name,
          builder: (context, state) => const ActivityEdit(),
        ),
        GoRoute(
            path: ':activityId',
            builder: (context, state) {
              return Activity(
                  activityId: state.pathParameters['activityId'] as String);
            }),
      ],
    ),
    GoRoute(
        path: '/login',
        name: Routes.login.home.name,
        builder: (context, state) => const LoginHomepage()),
  ],
);
