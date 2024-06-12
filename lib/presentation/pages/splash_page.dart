import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';
import 'package:recipe_app_bloc/core/utils/pref_helper.dart';
import 'package:recipe_app_bloc/core/utils/pref_key.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  String version = "";
  String buildNumber = "";

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this)
      ..forward()
      ..addStatusListener((_) async {
        await initialProcess();
      });
    super.initState();
  }

  Future<void> initialProcess() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    prefInstance.setString(PrefsKey.versionApp.name, version);
    prefInstance.setString(PrefsKey.buildNumber.name, buildNumber);

    final isFirstOpenApp = prefHelper.getIsFirstOpen ?? true;
    if (isFirstOpenApp) {
      if (mounted) {
        context.router.replaceAll([const WelcomeRoute()]);
      }
      prefInstance.setBool(PrefsKey.isFirstOpenApp.name, false);
    } else {
      if (mounted) {
        context.router.replaceAll([const HomeRoute()]);
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: ContentColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Text("Version $version - $buildNumber", textAlign: TextAlign.center, style: GoogleFonts.manrope(fontSize: 16, color: ContentColor.darkColor)),
            )
          ],
        ),
      ),
    );
  }
}