import 'data/model/sources_response/Sources_response.dart';

abstract interface class SourcesRepo {
  Future<SourcesResponse> getSources(String selectedCategory );

}