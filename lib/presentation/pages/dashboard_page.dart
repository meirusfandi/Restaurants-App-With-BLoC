import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_bloc/core/resources/injection_container.dart';
import 'package:recipe_app_bloc/core/routes/router.dart';
import 'package:recipe_app_bloc/core/utils/container.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';
import 'package:recipe_app_bloc/presentation/bloc/home_bloc.dart';
import 'package:recipe_app_bloc/presentation/widget/item_restaurants.dart';
import 'package:recipe_app_bloc/presentation/widget/loading_widget.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    sl<HomeBloc>().add(const GetRecipeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Food-E', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: ContentColor.darkColor)),
            actions: [
              InkWell(
                onTap: () {
                  context.router.push(const FavoriteRoute());
                },
                child: const Icon(Icons.favorite, color: Colors.redAccent),
              ).rightPadded()
            ],
          ),
          body: Stack(
            children: [
              if (state.isloading) const LoadingWidget(),
              SingleChildScrollView(
                child: (state.listRecipeEntity?.error == false) ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.listRecipeEntity?.count,
                  itemBuilder: (context, index) {
                    final data = state.listRecipeEntity?.restaurants[index];
                    return ItemRestaurants(data: data);
                  },
                ) : const SizedBox(),
              ),
            ],
          ),
        );
      }
    );
  }
}