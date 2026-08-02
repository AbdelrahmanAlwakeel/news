import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../data/model/articles_response/Article.dart';
import '../../domain/repo/articles_repo.dart';

@injectable
class ArticlesListViewModel extends Cubit<ArticlesListStates>{
  ArticlesListViewModel(this.articlesRepo):super(ArticlesListLoadingState()) ;
  ArticlesRepo articlesRepo;


  getArticles(String sourceId)async{
    try{
      // loading
      emit(ArticlesListLoadingState());
      var result = await articlesRepo.fetchArticles(sourceId);
      if(result.status!="error"){
        // success
        emit(ArticlesListSuccessState(result.articles??[]));
      }else{
        // error
        emit(ArticlesListErrorState(result.message!));
      }
    }catch(e){
      // error
      emit(ArticlesListErrorState(e.toString()));
    }
  }

}

sealed class ArticlesListStates{}
class ArticlesListLoadingState extends ArticlesListStates{}
class ArticlesListErrorState extends ArticlesListStates{
  String errorMessage;
  ArticlesListErrorState(this.errorMessage);
}
class ArticlesListSuccessState extends ArticlesListStates{
  List<Article> articles;
  ArticlesListSuccessState(this.articles);
}