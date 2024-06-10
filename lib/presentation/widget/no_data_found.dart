import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';

class NoDataFound extends StatelessWidget {
  final String title;

  const NoDataFound({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 5,
      child: Column(
        children: [
          const Icon(Icons.search, size: 64,),
          Text(title, style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w500, color: ContentColor.darkColor))
        ],
      ),
    );
  }
}