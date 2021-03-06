import 'package:dartz/dartz.dart';
import 'package:frontend/modules/search/domain/entities/result_search.dart';
import 'package:frontend/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
