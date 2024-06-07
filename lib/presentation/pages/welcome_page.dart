import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(); 
  }
}