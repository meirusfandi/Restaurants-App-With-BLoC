import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
  
}

class RouteDestination {
  final PageRouteInfo route;
  final IconData icon;
  final String label;

  const RouteDestination({
    required this.route,
    required this.icon,
    required this.label,
  });
}

class _HomePageState extends State<HomePage> {

  final destinations = [
    const RouteDestination(
      route: DashboardRoute(),
      icon: Icons.home,
      label: 'Dashboard',
    ),
    const RouteDestination(
      route: SearchRoute(),
      icon: Icons.search,
      label: 'Search',
    ),
    const RouteDestination(
      route: ProfileRoute(),
      icon: Icons.person,
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      builder: (context, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      selectedItemColor: ContentColor.primaryColor,
      onTap: tabsRouter.setActiveIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        )
      ],
    );
  }
}