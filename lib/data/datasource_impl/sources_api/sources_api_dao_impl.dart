import 'package:injectable/injectable.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/data/model/sources_response/Sources_response.dart';
import 'package:news/data/datasource/sources/sources_dao.dart';
@Injectable(as:SourcesDao )
class  SourcesApiDaoImpl implements SourcesDao{
  ApiManager apiManager;
  SourcesApiDaoImpl(this.apiManager);
  @override
Future<  SourcesResponse> fetchSources(String selectedCategory) async{
    var result = await apiManager.getSources(selectedCategory);
    return result;

  }


}