import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/features/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  final TextEditingController searchController = TextEditingController();

  Future<void> search() async {
    final String query = searchController.text.trim();
    if (query.isEmpty) return;

    emit(SearchLoadingState());
    try {
      final response = await ApiManager.search(query);

      if (response.status != 'error') {
        emit(SearchSuccessState(response.articles ?? []));
      } else {
        emit(SearchFailureState(response.message ?? 'Something went wrong'));
      }
    } catch (e) {
      emit(SearchFailureState(e.toString()));
    }
  }

  void clearSearch() {
    searchController.clear();
    emit(SearchInitialState());
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
