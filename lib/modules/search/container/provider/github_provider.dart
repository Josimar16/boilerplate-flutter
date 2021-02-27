import 'package:dio/dio.dart';
import 'package:project/modules/search/domain/errors/errors.dart';
import 'package:project/modules/search/infra/datasources/search_datasource.dart';
import 'package:project/modules/search/infra/models/result_search_model.dart';

extension on String {
  eliminateSpacesInText() {
    return this.replaceAll(" ", "+");
  }
}

class GithubProvider implements SearchDatasource {
  final Dio dio;

  GithubProvider(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get(
        "https://api.github.com/search/users?q=${searchText.eliminateSpacesInText()}");
    print(response.data['items']);
    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((item) => ResultSearchModel.fromJson(item))
          .toList();

      return list;
    } else {
      throw DatasourceError();
    }
  }
}
