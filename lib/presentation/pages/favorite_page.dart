import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePageState();
  
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  void initState() {
    debugPrint("favorite page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}