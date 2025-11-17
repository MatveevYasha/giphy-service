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
      },
    );
  }

  Future<void> _initial(InitialHomeEvent event, Emitter<HomeState> emit) async {
    try {
      final List<Gif> gifs = await _repository.getGifs();

      emit(SuccessHomeState(gifs: gifs));
    } on Exception catch (_) {
      emit(ErrorHomeState());
    }
  }
}
