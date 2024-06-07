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
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: DashboardRoute.page),
    AutoRoute(page: DetailRoute.page),
    AutoRoute(page: FavoriteRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WelcomeRoute.page),
  ];
}