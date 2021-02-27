import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/modules/search/domain/entities/result_search.dart';
import 'package:project/modules/search/domain/errors/errors.dart';
import 'package:project/modules/search/infra/datasources/search_datasource.dart';
import 'package:project/modules/search/infra/models/result_search_model.dart';
import 'package:project/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test("should be able return list ResultSearch", () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("josimar16");

    expect(result | null, isA<List<ResultSearch>>());
  });

  test(
      "should not be able return list ResultSearch case the datasource failure",
      () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search("josimar16");

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
