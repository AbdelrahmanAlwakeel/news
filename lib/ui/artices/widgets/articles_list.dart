import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/di/di.dart';
import 'package:news/core/remote/network/api_manager.dart';
 import 'package:news/ui/artices/widgets/view_model/articles_list_view_model.dart';


import '../../../data/datasource_impl/articles_api/articles_api_dao_impl.dart';
import '../../../data/model/articles_response/Article.dart';
import '../../../data/model/sources_response/Source.dart';
import '../../../data/repo_impl/articles/articles_repo_impl.dart';
import 'article_item.dart';

class ArticlesList extends StatelessWidget {
  final Source source;
  const ArticlesList({super.key,required this.source});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<ArticlesListViewModel>()..getArticles(source.id!),
        child: BlocBuilder<ArticlesListViewModel,ArticlesListStates>(
          builder: (context, state) {
            switch(state){

              case ArticlesListLoadingState():{
                return Center(child: CircularProgressIndicator(),);
              }
              case ArticlesListErrorState():{
                return Center(child: Text(state.errorMessage),);
              }
              case ArticlesListSuccessState():{
                List<Article> articles = state.articles;
                if(articles.isEmpty){
                  return Center(child: Text("No articles found"),);
                }
                return ListView.separated(
                    itemBuilder: (context, index) => ArticleItem(article: articles[index],),
                    separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                    itemCount: articles.length
                );
              }
            }
          },
        ),
    )
    ;
  }
}
