// import 'package:flutter_modular/flutter_modular_annotations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/search/domain/entities/result.dart';
import 'package:frontend/app/search/domain/errors/errors.dart';
import 'package:frontend/app/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
part 'search_by_text.g.dart';

abstract class SearchByText {
  Future<Either<Failure, List<Result>>> call(String searchText);
}

@Injectable(singleton: false)
class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<Failure, List<Result>>> call(String searchText) async {
    var option = optionOf(searchText);
    return option.fold(() => Left(InvalidSearchText()), (text) async {
      var result = await repository.getUsers(text);
      return result.where((r) => r.isNotEmpty, () => EmptyList());
    });
  }
}
