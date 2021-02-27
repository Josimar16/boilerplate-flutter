import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/modules/search/domain/entities/result_search.dart';
import 'package:project/modules/search/domain/errors/errors.dart';
import 'package:project/modules/search/domain/repositories/search_repository.dart';
import 'package:project/modules/search/domain/usecases/search_by_text.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('should be able return list ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase("josimar16");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('should not be able return list ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
