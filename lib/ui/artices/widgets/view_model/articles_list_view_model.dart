import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/data/datasource_impl/articles_api/articles_api_dao_impl.dart';
import 'package:news/data/repo_impl/articles/articles_repo_impl.dart';


import '../../../../articles_repo.dart';
import '../../../../data/datasource/articles/articles_dao.dart';
import '../../../../data/model/articles_response/Article.dart';
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