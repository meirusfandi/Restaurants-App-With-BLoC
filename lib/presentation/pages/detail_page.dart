import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_bloc/core/resources/injection_container.dart';
import 'package:recipe_app_bloc/core/utils/constants.dart';
import 'package:recipe_app_bloc/core/utils/container.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';
import 'package:recipe_app_bloc/presentation/bloc/detail_bloc.dart';
import 'package:recipe_app_bloc/presentation/widget/loading_widget.dart';

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
    sl<DetailBloc>().add(GetDetailRecipeEvent(restaurantsId: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              if (state.isloading) const LoadingWidget(),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                          child: CachedNetworkImage(
                            imageUrl: "${imageServer}large/${state.detailRecipeEntity?.restaurant.pictureId ?? ''}",
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) => SizedBox(
                              child: const Icon(Icons.broken_image).rightPadded(),
                            ),
                            placeholder: (context, url) => const CircularProgressIndicator(),
                          )
                        ),
                        Text(state.detailRecipeEntity?.restaurant.name ?? '', style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w700, color: ContentColor.darkColor)).padded(),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: ContentColor.primaryColor).rightPadded(8),
                            Text(state.detailRecipeEntity?.restaurant.city ?? '', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: ContentColor.greyColor)),
                          ],
                        ).horizontalPadded().bottomPadded(8),
                        Row(
                          children: [
                            Icon(Icons.star, color: ContentColor.warningColor).rightPadded(8),
                            Text(state.detailRecipeEntity?.restaurant.city ?? '', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: ContentColor.greyColor)),
                          ],
                        ).horizontalPadded(),
                        const Divider().horizontalPadded().verticalPadded(8),
                        Text('Description: ', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: ContentColor.darkColor)).horizontalPadded(),
                        Text(state.detailRecipeEntity?.restaurant.description ?? '', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: ContentColor.greyColor)).horizontalPadded().topPadded(8),
                        const Divider().horizontalPadded().verticalPadded(8),
                        Text('Menu\'s: ', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: ContentColor.darkColor)).horizontalPadded(),
                        Text('Foods: ', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: ContentColor.darkColor)).horizontalPadded().topPadded(),
                        SizedBox(
                          height: 36,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.detailRecipeEntity?.restaurant.menus.foods.length ?? 0,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                  color: ContentColor.lightColor,
                                ),
                                child: Text(
                                  state.detailRecipeEntity?.restaurant.menus.foods[index].name ?? '',
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ContentColor.greyColor
                                  )
                                ).verticalPadded(4).horizontalPadded(8)
                              ).horizontalPadded(4);
                            }
                          ).horizontalPadded().topPadded(8),
                        ),
                        Text('Drinks: ', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: ContentColor.darkColor)).horizontalPadded().topPadded(),
                        SizedBox(
                          height: 36,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.detailRecipeEntity?.restaurant.menus.drinks.length ?? 0,
                            itemBuilder: (context, index) {
                              return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                    color: ContentColor.lightColor,
                                  ),
                                  child: Text(
                                      state.detailRecipeEntity?.restaurant.menus.drinks[index].name ?? '',
                                      style: GoogleFonts.manrope(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: ContentColor.greyColor
                                      )
                                  ).verticalPadded(4).horizontalPadded(8)
                              ).horizontalPadded(4);
                            }
                          ).horizontalPadded().topPadded(8),
                        ).bottomPadded(),
                      ],
                    ),
                    Positioned(
                      top: 32,
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => context.back(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ContentColor.whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.arrow_back, color: ContentColor.darkColor).padded(10),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}