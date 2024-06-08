import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.center,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _itemInfo(
                    title: "AWESOME\n",
                    contentTitle: "LOCAL ",
                    contentDescription: "FOOD",
                    content: "Discover delicious food from the amazing restaurants near you",
                    iconName: 'assets/images/onboarding-1.png',
                  ),
                  _itemInfo(
                    title: "DELIVERED AT\n YOUR ",
                    contentTitle: "DOORSTEP",
                    contentDescription: "",
                    content: "Fresh and delicious local food delivered from the restaurants to your doorstep",
                    iconName: 'assets/images/onboarding-2.png',
                  ),
                  _itemInfo(
                    title: "GRAB THE\nBEST ",
                    contentTitle: "DEALS",
                    contentDescription: " AROUND",
                    content: "Grab the best deals and discounts around and save on your every order",
                    iconName: 'assets/images/onboarding-3.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemInfo({required String title, required String contentTitle, required String contentDescription, required String content, required String iconName}) {
    return Stack(
      children: [
        Image.asset(
          iconName,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 32,
          left: 0,
          child: Image.asset('assets/images/white-logo.png', height: 20, width: 80),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(text: title, style: TextStyle(fontSize: 24, color: ContentColor.whiteColor)),
                    TextSpan(text: contentTitle, style: TextStyle(fontSize: 24, color: ContentColor.primaryColor)),
                    TextSpan(text: contentDescription, style: TextStyle(fontSize: 24, color: ContentColor.whiteColor)),
                  ]
                )
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Text(content, style: GoogleFonts.manrope(fontSize: 14, color: ContentColor.whiteColor),),
              const Padding(padding: EdgeInsets.all(16)),
              InkWell(
                onTap: () {
                  setState(() {
                    if (_currentPage == 2) {
                      debugPrint("get started click");
                      context.router.replaceAll([const HomeRoute()]);
                    } else {
                      _currentPage++;
                      _pageController.jumpToPage(_currentPage);
                      _pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    color: ContentColor.primaryColor
                  ),
                  child: Text((_currentPage == 2) ? "Get Started" : "Next", textAlign: TextAlign.center, style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.bold, color: ContentColor.whiteColor)),
                ),
              )
            ],
          )
        )
      ],
    );
  }
}