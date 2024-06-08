import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_bloc/presentation/pages/dashboard_page.dart';
import 'package:recipe_app_bloc/presentation/pages/detail_page.dart';
import 'package:recipe_app_bloc/presentation/pages/favorite_page.dart';
import 'package:recipe_app_bloc/presentation/pages/home_page.dart';
import 'package:recipe_app_bloc/presentation/pages/profile_page.dart';
import 'package:recipe_app_bloc/presentation/pages/search_page.dart';
import 'package:recipe_app_bloc/presentation/pages/splash_page.dart';
import 'package:recipe_app_bloc/presentation/pages/welcome_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: WelcomeRoute.page, path: '/welcome-screen'),
    AutoRoute(page: FavoriteRoute.page, path: '/favorite-screen'),
    AutoRoute(page: DetailRoute.page, path: '/detail-screen'),
    CustomRoute(
      children: [
        AutoRoute(page: DashboardRoute.page, path: 'dashboard-screen'),
        AutoRoute(page: SearchRoute.page, path: 'search-screen'),
        AutoRoute(page: ProfileRoute.page, path: 'profile-screen'),
      ],
      page: HomeRoute.page,
      path: '/home-screen',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),
  ];
}