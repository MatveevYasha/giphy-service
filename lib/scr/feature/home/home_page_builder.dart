import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_state.dart';
import 'package:giphy_service/scr/feature/home/widgets/empty_list_widget.dart';
import 'package:giphy_service/scr/feature/home/widgets/errors_widget.dart';
import 'package:giphy_service/scr/feature/home/widgets/loading_widget.dart';
import 'package:giphy_service/scr/feature/home/widgets/success_widget.dart';

class HomePageBuilder extends StatelessWidget {
  const HomePageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            LoadingHomeState() => const LoadingWidget(),
            SuccessHomeState() => switch (state.gifs.isEmpty) {
              true => const EmptyListWidget(),
              _ => SuccessWidget(gifs: state.gifs),
            },
            _ => const ErrorsWidget(),
          };
        },
      ),
    );
  }
}
