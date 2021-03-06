import 'package:frontend/app/search/domain/errors/errors.dart';
import 'package:frontend/app/search/infra/datasources/search_datasource.dart';
import 'package:frontend/app/search/infra/models/result_search_model.dart';
import 'package:frontend/app/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test('deve retornar uma lista de ResultModel', () async {
    when(datasource.searchText("josimar16"))
        .thenAnswer((_) async => <ResultModel>[ResultModel()]);

    var result = await repository.getUsers("josimar16");
    expect(result | null, isA<List<ResultModel>>());
  });

  test('deve retornar um ErrorSearch caso seja lançado throw no datasource',
      () async {
    when(datasource.searchText("josimar16")).thenThrow(ErrorSearch());

    var result = await repository.getUsers("josimar16");
    expect(result.fold(id, id), isA<ErrorSearch>());
  });
  test(
      'deve retornar um DatasourceResultNull caso o retorno do datasource seja nulo',
      () async {
    when(datasource.searchText("josimar16")).thenAnswer((_) async => null);

    var result = await repository.getUsers("josimar16");
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });
}
