import 'package:flutter/material.dart';
import 'package:recipe_app_bloc/core/resources/injection_container.dart';
import 'package:recipe_app_bloc/core/utils/container.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';
import 'package:recipe_app_bloc/presentation/bloc/search_bloc.dart';
import 'package:recipe_app_bloc/presentation/widget/item_restaurants.dart';
import 'package:recipe_app_bloc/presentation/widget/loading_widget.dart';
import 'package:recipe_app_bloc/presentation/widget/no_data_found.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                if (state.isloading) const LoadingWidget(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textCapitalization: TextCapitalization.words,
                      onChanged: (value) {
                        if (value.length >= 3) {
                          sl<SearchBloc>().add(SearchRecipeEvent(query: value));
                        }
                      },
                      textInputAction: TextInputAction.search,
                      onSaved: (value) {},
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                          child: const Icon(Icons.search).horizontalPadded(),
                        ),
                        prefixIconConstraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                        suffixIcon: _searchController.text.isEmpty
                        ? null
                        : InkWell(
                          onTap: () {
                            if (_searchController.text.isNotEmpty) {
                              _searchController.clear();
                              setState(() {});
                            }
                          },
                          child: Icon(Icons.cancel, size: 18, color: ContentColor.greyColor),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: ContentColor.greyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: ContentColor.greyColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: ContentColor.greyColor,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        hintText: '',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        focusColor: Colors.black54,
                      ),
                    ).topPadded(32).horizontalPadded(),
                    (_searchController.text.isEmpty)
                    ? const NoDataFound(title: "Please type restaurants name")
                    : ((state.searchRecipeEntity?.founded ?? 0) > 0)
                    ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.searchRecipeEntity?.founded,
                      itemBuilder: (context, index) {
                        var data = state.searchRecipeEntity?.restaurants[index];
                        return ItemRestaurants(data: data);
                      }
                    ) : const NoDataFound(title: "Data Not Found!")
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}