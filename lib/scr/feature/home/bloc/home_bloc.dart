import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_event.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGifsRepository _repository;

  HomeBloc({required GetGifsRepository repository})
    : _repository = repository,
      super(LoadingHomeState()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        final InitialHomeEvent event => _initial(event, emit),
        final LoadMoreHomeEvent event => _loadMore(event, emit),
      },
    );
  }

  Future<void> _initial(InitialHomeEvent event, Emitter<HomeState> emit) async {
    try {
      final List<Gif> gifs = await _repository.getGifs(limit: _limit);

      emit(SuccessHomeState(gifs: gifs));
    } on Exception catch (_) {
      emit(ErrorHomeState());
    }
  }

  Future<void> _loadMore(LoadMoreHomeEvent event, Emitter<HomeState> emit) async {
    final offset = state.gifs?.length ?? _limit;

    emit((state as SuccessHomeState).copyWith(isLoadingMore: true));

    try {
      final List<Gif> gifs = await _repository.getGifs(limit: _limit, offset: offset);

      emit(SuccessHomeState(gifs: [...?state.gifs, ...gifs], isLoadingMore: false));
    } on Exception catch (_) {
      emit(ErrorHomeState());
    }
  }

  static const _limit = 20;
}
