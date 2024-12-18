part of 'search_bloc.dart';





class SearchState {
  final Status status;
  final List<Result> result;

  SearchState({this.status = Status.initial,this.result = const []});

  SearchState copyWith({
    Status? status,
    List<Result>? result,
  }) {
    return SearchState(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }
}


