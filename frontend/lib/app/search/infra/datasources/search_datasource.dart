import 'package:frontend/app/search/infra/models/result_search_model.dart';

abstract class SearchDatasource {
  Future<List<ResultModel>> searchText(String textSearch);
}
