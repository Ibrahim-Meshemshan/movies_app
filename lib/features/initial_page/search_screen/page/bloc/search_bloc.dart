import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/exception/status.dart';
import '../../data/model/search_response_model.dart';
import '../../repo/search_repo.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState(result: [], status: Status.initial)) {
    on<PageSearchEvent>((event, emit) async {
      print(event.text);
      emit(SearchState(status: Status.loading));
      final result = await SearchRepo().getSearch(event.text);
      result.fold(
        (left) {
          emit(state.copyWith(status: Status.failed));
        },
        (right) {
          emit(state.copyWith(status: Status.success,result: right.results));
        },
      );
    },
        transformer: restartable(),
    );
  }
}
