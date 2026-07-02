import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/sources_repo.dart';

import '../../../../core/remote/network/api_manager.dart';
import '../../../../data/model/sources_response/Source.dart';
@injectable
class SourcesViewModel extends Cubit<SourcesState>{
  SourcesViewModel(this.sourcesRepo):super(SourcesLoadingState());

  SourcesRepo sourcesRepo;


  getSources(String selectedCategory)async{
    try{
      // loading
      emit(SourcesLoadingState());
      var result = await sourcesRepo.getSources(selectedCategory);
      if(result.status!="error"){
        // success
        emit(SourcesSuccessState(result.sources??[]));
      }else{
        // error
        emit((SourcesErrorState(result.message!)));
      }
    }catch(e){
      // exception error
      emit(SourcesErrorState(e.toString()));
    }
  }
}

sealed class SourcesState{}

class SourcesLoadingState extends SourcesState{}
class SourcesErrorState extends SourcesState{
  String errorMessage;
  SourcesErrorState(this.errorMessage);
}
class SourcesSuccessState extends SourcesState{
  List<Source> sources;
  SourcesSuccessState(this.sources);
}