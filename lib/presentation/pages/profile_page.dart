import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/container.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';
import 'package:recipe_app_bloc/core/utils/pref_helper.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContentColor.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
              Text("Mei Rusfandi", style: GoogleFonts.manrope(fontSize: 18, color: ContentColor.darkColor, fontWeight: FontWeight.bold)),
              Text('meirusfandi100@gmail.com', style: GoogleFonts.manrope(fontSize: 16, color: ContentColor.darkColor)),
              Text('Mobile Engineer', style: GoogleFonts.manrope(fontSize: 16, color: ContentColor.darkColor)),
              ShadowedContainer(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Experience', style: GoogleFonts.manrope(color: ContentColor.darkColor, fontSize: 18.0, fontWeight: FontWeight.bold),),
                          Text('>5 Years', style: GoogleFonts.manrope(color: ContentColor.darkColor),)
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Text('Skills', style: GoogleFonts.manrope(color: ContentColor.darkColor, fontSize: 18.0, fontWeight: FontWeight.bold),),
                          Text('10 Skills', style: GoogleFonts.manrope(color: ContentColor.darkColor),)
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Text('Project', style: GoogleFonts.manrope(color: ContentColor.darkColor, fontSize: 18.0, fontWeight: FontWeight.bold),),
                          Text('10 Apps', style: GoogleFonts.manrope(color: ContentColor.darkColor),)
                        ],
                      ),
                    ],
                  ).bottomPadded(),

                  const Text("Im working as Mobile Engineer at PT Peruri Digital Security (PDS) INA Digital of GovTech Health, based on Palatehan, Jakarta Selatan. As a Mobile Engineer, i have experiences on build Android Java, and Flutter. In this company i've been helped my team on develop Satu Sehat Mobile Apps using Flutter. Still continue on learning Flutter, start to learn iOS Programming and React Native. I have experiences on build REST API (Backend) with Golang. And available to work on Website development with PHP Codeigniter.", textAlign: TextAlign.justify,),

                  InkWell(
                    onTap: () {
                      context.router.push(const SettingRoute());
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.notifications).rightPadded(8),
                        const Expanded(child: Text("Create Reminder")),
                        Icon(Icons.chevron_right, color: ContentColor.greyColor)
                      ],
                    ).topPadded(32),
                  ),

                  Text("Version app: ${prefHelper.getVersionApp} - ${prefHelper.getBuildNumber}", style: GoogleFonts.manrope(fontSize: 16, color: ContentColor.errorColor, fontWeight: FontWeight.w500),).padded(),
                ]
              ).padded()
            ],
          )
        ),
      ),
    );
  }
}