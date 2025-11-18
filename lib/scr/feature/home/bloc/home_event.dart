sealed class HomeEvent {}

class InitialHomeEvent extends HomeEvent {}

class LoadMoreHomeEvent extends HomeEvent {}

class SearchHomeEvent extends HomeEvent {
  final String searchString;

  SearchHomeEvent({required this.searchString});
}
