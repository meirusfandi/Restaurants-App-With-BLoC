import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
  
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    debugPrint("dashboard");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}