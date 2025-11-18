import 'package:core/core.dart';

sealed class HomeState {
  List<Gif>? get gifs;

  HomeState();
}

class LoadingHomeState extends HomeState {
  @override
  final List<Gif>? gifs;

  LoadingHomeState({this.gifs});
}

class SuccessHomeState extends HomeState {
  @override
  final List<Gif> gifs;

  SuccessHomeState({required this.gifs});
}

class ErrorHomeState extends HomeState {
  @override
  final List<Gif>? gifs;

  ErrorHomeState({this.gifs});
}
