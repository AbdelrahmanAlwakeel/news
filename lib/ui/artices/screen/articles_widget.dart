import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/di/di.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/data/datasource_impl/sources_api/sources_api_dao_impl.dart';
import 'package:news/data/repo_impl/sources/sources_repo_impl.dart';
import 'package:news/ui/artices/screen/view_model/suorces_view_model.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../data/model/category_model.dart';
import '../../../data/model/sources_response/Source.dart';
import '../widgets/articles_list.dart';

class ArticlesWidget extends StatefulWidget {
  CategoryModel selectedCategory;

  ArticlesWidget(this.selectedCategory);

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SourcesViewModel>() ..getSources(widget.selectedCategory.id),
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (context, state) {
          switch(state){

          case SourcesLoadingState():{
          return Center(child: CircularProgressIndicator(),);
          }
          case SourcesErrorState():{
           return Center(child: Text(state.errorMessage),);
          }
          case SourcesSuccessState():{
            List<Source> sourcesList = state.sources;
            return Padding(
              padding: REdgeInsets.all(15),
              child: DefaultTabController(
                length:sourcesList.length ,
                child: Column(
                  spacing: 16.h,
                  children: [
                    TabBar(
                        labelStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.lightPrimaryColor
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.lightPrimaryColor
                        ),
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        tabs: sourcesList.map((source)=>Tab(
                          text:source.name ,
                        )).toList()),
                    Expanded(child: TabBarView(children: sourcesList.map((source) =>   ArticlesList(source: source,),).toList()))
                  ],
                ),
              ),
            );
          }
          }

        },
      ),
    ) /*FutureBuilder(
        future: ApiManager.getSources(widget.selectedCategory.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: InkWell(
                onTap: (){
                  setState(() {

                  });
                },
                child: Text("No Internet Connection")),);
          }
          var sourcesResponse = snapshot.data;
          if(sourcesResponse?.status=="error"){
            return Center(child: Text(sourcesResponse?.message??""),);
          }
          List<Source> sourcesList = sourcesResponse?.sources??[];
          return Padding(
            padding: REdgeInsets.all(15),
            child: DefaultTabController(
              length:sourcesList.length ,
              child: Column(
                spacing: 16.h,
                children: [
                  TabBar(
                      labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.lightPrimaryColor
                      ),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.lightPrimaryColor
                      ),
                      dividerHeight: 0,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: sourcesList.map((source)=>Tab(
                        text:source.name ,
                      )).toList()),
                  Expanded(child: TabBarView(children: sourcesList.map((source) => ArticlesList(source: source,),).toList()))
                ],
              ),
            ),
          );
        },
    )*/;
  }
}
