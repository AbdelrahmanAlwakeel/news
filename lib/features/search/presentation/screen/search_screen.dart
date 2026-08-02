import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/resources/colors_manager.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';
import '../widgets/build_success_state_view.dart';
import '../widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchTextField(),
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                switch (state) {
                  case SearchInitialState():
                    return _buildInitialState();

                  case SearchLoadingState():
                    return _buildLoadingState();

                  case SearchFailureState():
                    return _buildFailureState(state.errorMessage);

                  case SearchSuccessState():
                    return BuildSuccessStateView(
                      articles: state.articles ?? [],
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildInitialState() {
  return Expanded(
    child: Center(
      child: Text(
        "Search for news",
        style: TextStyle(
          fontSize: 16,
          fontWeight: .w500,
          color: ColorsManager.lightPrimaryColor,
        ),
      ),
    ),
  );
}

Widget _buildLoadingState() {
  return Expanded(
    child: Center(
      child: CircularProgressIndicator(color: ColorsManager.lightPrimaryColor),
    ),
  );
}

Widget _buildFailureState(String errorMessage) {
  return Center(
    child: Text(
      errorMessage,
      style: TextStyle(
        fontSize: 16,
        fontWeight: .w500,
        color: ColorsManager.lightPrimaryColor,
      ),
    ),
  );
}
