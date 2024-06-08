import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _DetailPageState();
  
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    debugPrint("detail page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}