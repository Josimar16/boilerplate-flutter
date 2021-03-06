import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/search/domain/entities/result.dart';
import 'package:frontend/app/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/app/search/domain/repositories/search_repository.dart';
import 'package:frontend/app/search/infra/datasources/search_datasource.dart';
import 'package:frontend/app/search/infra/models/result_search_model.dart';
part 'search_repository_impl.g.dart';

@Injectable(singleton: false)
class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Result>>> getUsers(String searchText) async {
    List<ResultModel> list;
    try {
      list = await datasource.searchText(searchText);
    } catch (e) {
      return left(ErrorSearch());
    }
    return list == null ? Left(DatasourceResultNull()) : right(list);
  }
}
