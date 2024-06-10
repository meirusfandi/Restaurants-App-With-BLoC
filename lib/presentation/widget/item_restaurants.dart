import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/constants.dart';
import 'package:recipe_app_bloc/core/utils/container.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';
import 'package:recipe_app_bloc/domain/entity/list_recipe_entity.dart';

class ItemRestaurants extends StatelessWidget {
  final RecipeDataEntity? data;

  const ItemRestaurants({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(DetailRoute(id: data?.id ?? ''));
      },
      child: Card(
        elevation: 0.0,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Hero(tag: 'image_${data?.name}-${Random().nextInt(100)}',child: Image.network("$imageServer/small/${data?.pictureId ?? ''}", fit: BoxFit.cover, height: 80, width: 100,)),
          ),
          title: Text(data?.name ?? '', maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: ContentColor.darkColor),),
          subtitle: Row(
            children: <Widget>[
              const Icon(Icons.star, size: 20, color: Colors.amber,),
              Text(data?.rating.toString() ?? '', style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w500, color: ContentColor.greyColor)),
              Text('  |  ${data?.city}', style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w500, color: ContentColor.greyColor)),
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
        ),
      ).padded(4),
    );
  }
}