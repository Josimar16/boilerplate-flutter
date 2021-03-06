import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/search/infra/models/result_search_model.dart';
import 'package:frontend/app/search/infra/datasources/search_datasource.dart';
import 'package:http/http.dart';
part 'github_search_datasource.g.dart';

@Injectable(singleton: false)
class GithubSearchDatasource implements SearchDatasource {
  final Client client;

  GithubSearchDatasource(this.client);

  @override
  Future<List<ResultModel>> searchText(String textSearch) async {
    final url = Uri.https('api.github.com', '/search/users',
        {'q': '${textSearch.trim().replaceAll(' ', '+')}'});

    final result = await this.client.get(url);

    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      final jsonList = json['items'] as List;
      final list = jsonList
          .map((item) => ResultModel(
              nickname: item['login'],
              image: item['avatar_url'],
              url: item['url']))
          .toList();

      return list;
    } else {
      throw Exception();
    }
  }
}
