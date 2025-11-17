import 'package:api_client/scr/providers/get_gifs_provider/get_gifs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_event.dart';
import 'package:giphy_service/scr/feature/home/data/get_gifs_repository_impl.dart';
import 'package:giphy_service/scr/feature/home/home_page_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(repository: GetGifsRepositoryImpl(provider: ApiGifsProvider()))
            ..add(InitialHomeEvent()),
      child: HomePageBuilder(),
    );
  }
}
