// @Injectable()
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/search/domain/usecases/search_by_text.dart';
import 'package:frontend/app/search/presenter/states/search_state.dart';
import 'package:rxdart/rxdart.dart';
part 'search_bloc.g.dart';

@Injectable()
class SearchBloc extends Bloc<String, SearchState> implements Disposable {
  final SearchByText searchByText;

  SearchBloc(this.searchByText) : super(StartState());

  @override
  Stream<SearchState> mapEventToState(String textSearch) async* {
    if (textSearch.isEmpty) {
      yield StartState();
      return;
    }

    yield LoadingState();

    final result = await searchByText(textSearch);
    yield result.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    events = events.debounceTime(Duration(milliseconds: 500));
    return super.transformEvents(events, transitionFn);
  }

  @override
  void dispose() {
    this.close();
  }
}
