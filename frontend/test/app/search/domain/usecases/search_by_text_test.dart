import 'package:frontend/app/search/domain/entities/result.dart';
import 'package:frontend/app/search/domain/errors/errors.dart';
import 'package:frontend/app/search/domain/repositories/search_repository.dart';
import 'package:frontend/app/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('should be able return the list with results', () async {
    when(repository.getUsers("josimar16"))
        .thenAnswer((_) async => right(<Result>[Result()]));

    var result = await usecase("josimar16");
    expect(result | null, isA<List<Result>>());
  });

  test('should be able return the InvalidSearchText case the text be invalid',
      () async {
    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidSearchText>());
  });
  test('deve retornar um EmptyList caso o retorno seja vazio', () async {
    when(repository.getUsers("josimar16"))
        .thenAnswer((_) async => right(<Result>[]));

    var result = await usecase("josimar16");
    expect(result.fold(id, id), isA<EmptyList>());
  });
}
