import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/modules/search/container/provider/github_provider.dart';
import 'package:project/modules/search/domain/errors/errors.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final provider = GithubProvider(dio);
  test('should be able return list ResultSearchModel', () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(githubResult), statusCode: 200));

    final future = provider.getSearch("josimar16");
    expect(future, completes);
  });

  test('should be able return Exception', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    final future = provider.getSearch("josimar16");
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('should not be able return list ResultSearchModel if code is not 200',
      () async {
    when(dio.get(any)).thenThrow(Exception());

    final future = provider.getSearch("josimar16");
    expect(future, throwsA(isA<Exception>()));
  });
}
