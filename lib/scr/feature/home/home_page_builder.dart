import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_event.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_state.dart';
import 'package:giphy_service/scr/feature/home/widgets/empty_list_widget.dart';
import 'package:giphy_service/scr/feature/home/widgets/errors_widget.dart';
import 'package:giphy_service/scr/feature/home/widgets/loading_widget.dart';
import 'package:giphy_service/scr/feature/home/widgets/success_widget.dart';

class HomePageBuilder extends StatefulWidget {
  const HomePageBuilder({super.key});

  @override
  State<HomePageBuilder> createState() => _HomePageBuilderState();
}

class _HomePageBuilderState extends State<HomePageBuilder> {
  final _searchController = ValueNotifier<String>('');

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextField(
          decoration: InputDecoration(hintText: 'Search...', border: InputBorder.none),
          onChanged: (value) {
            _searchController.value = value;
            if (value == '') context.read<HomeBloc>().add(InitialHomeEvent());

            context.read<HomeBloc>().add(SearchHomeEvent(searchString: value));
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            LoadingHomeState() => const LoadingWidget(),
            SuccessHomeState() => switch (state.gifs.isEmpty) {
              true => const EmptyListWidget(),
              _ => SuccessWidget(
                gifs: state.gifs,
                isLoadingMore: state.isLoadingMore,
                searchController: _searchController,
              ),
            },
            _ => const ErrorsWidget(),
          };
        },
      ),
    );
  }
}
