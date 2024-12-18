part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class PageSearchEvent extends SearchEvent {
  final String text;
  PageSearchEvent({required this.text});
}
