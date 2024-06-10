import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:recipe_app_bloc/core/resources/injection_container.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/pref_helper.dart';
import 'package:recipe_app_bloc/generated/l10n.dart';
import 'package:recipe_app_bloc/presentation/bloc/detail_bloc.dart';
import 'package:recipe_app_bloc/presentation/bloc/home_bloc.dart';
import 'package:recipe_app_bloc/presentation/bloc/search_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app_bloc/core/resources/injection_container.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefInstance = await SharedPreferences.getInstance();

  await injector.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var app = AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark
        ),
        child: ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(375, 720),
            builder: (context, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                ...GlobalMaterialLocalizations.delegates,
              ],
              routerDelegate: appRouter.delegate(
                navigatorObservers: () => [
                  AutoRouteObserver(),
                ],
              ),
              theme: ThemeData(fontFamily: GoogleFonts.manrope().fontFamily),
              routeInformationParser: appRouter.defaultRouteParser(),
              supportedLocales: S.delegate.supportedLocales,
            )
        )
    );

    return KeyboardDismisser(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (BuildContext context) => sl<HomeBloc>()),
          BlocProvider<DetailBloc>(create: (BuildContext context) => sl<DetailBloc>()),
          BlocProvider<SearchBloc>(create: (BuildContext context) => sl<SearchBloc>())
        ],
        child: app
      ),
    );
  }
}