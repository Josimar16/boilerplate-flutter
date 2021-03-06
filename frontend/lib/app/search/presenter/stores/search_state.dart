import 'package:frontend/app/search/domain/entities/result.dart';
import 'package:frontend/app/search/domain/errors/errors.dart';

abstract class SearchState {}

class StartState implements SearchState {}

class LoadingState implements SearchState {}

class ErrorState implements SearchState {
  final Failure error;
  ErrorState(this.error);
}

class SuccessState implements SearchState {
  final List<Result> list;
  SuccessState(this.list);
}
