import 'package:news/data/model/sources_response/Sources_response.dart';


abstract interface class SourcesDao {
 Future<SourcesResponse> fetchSources(String selectedCategory);

}