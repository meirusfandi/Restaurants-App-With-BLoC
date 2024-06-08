import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    debugPrint("home page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}