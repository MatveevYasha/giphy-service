import 'package:core/core.dart';

sealed class HomeState {
  List<Gif>? get gifs;
  final bool isLoadingMore;

  HomeState({this.isLoadingMore = false});
}

class LoadingHomeState extends HomeState {
  @override
  final List<Gif>? gifs;

  LoadingHomeState({this.gifs});
}

class SuccessHomeState extends HomeState {
  @override
  final List<Gif> gifs;

  SuccessHomeState({required this.gifs, super.isLoadingMore});

  SuccessHomeState copyWith({List<Gif>? gifs, bool? isLoadingMore}) {
    return SuccessHomeState(
      gifs: gifs ?? this.gifs,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class ErrorHomeState extends HomeState {
  @override
  final List<Gif>? gifs;

  ErrorHomeState({this.gifs});
}
