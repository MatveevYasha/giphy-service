import 'package:core/core.dart';

sealed class HomeState {}

class LoadingHomeState extends HomeState {
  LoadingHomeState();
}

class SuccessHomeState extends HomeState {
  final List<Gif> gifs;

  SuccessHomeState({required this.gifs});
}

class ErrorHomeState extends HomeState {
  ErrorHomeState();
}
