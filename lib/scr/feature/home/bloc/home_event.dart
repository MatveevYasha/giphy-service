sealed class HomeEvent {}

class InitialHomeEvent extends HomeEvent {}

class LoadMoreHomeEvent extends HomeEvent {
  final String? searchString;

  LoadMoreHomeEvent({this.searchString});
}

class SearchHomeEvent extends HomeEvent {
  final String searchString;

  SearchHomeEvent({required this.searchString});
}
