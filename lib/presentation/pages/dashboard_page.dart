import 'package:flutter/material.dart';
import 'package:recipe_app_bloc/core/resources/injection_container.dart';
import 'package:recipe_app_bloc/core/utils/container.dart';
import 'package:recipe_app_bloc/core/utils/shimmer.dart';
import 'package:recipe_app_bloc/presentation/bloc/home_bloc.dart';

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
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: (state.isloading) ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ShimmerBox().loadShimmer();
              },
            ) : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.listRecipeEntity?.count,
              itemBuilder: (context, index) {
                final data = state.listRecipeEntity?.restaurants[index];
                return Container(
                  child: Text(data?.name ?? ''),
                );
              },
            ),
          ),
        );
      }
    );
  }
}