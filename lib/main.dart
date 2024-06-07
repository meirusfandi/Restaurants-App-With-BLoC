import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app_bloc/core/resources/injection_container.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefInstance = await SharedPreferences.getInstance();

  await injector.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config()
    );
  }
}