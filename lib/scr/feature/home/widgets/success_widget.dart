import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_event.dart';

class SuccessWidget extends StatelessWidget {
  final List<Gif> gifs;

  const SuccessWidget({super.key, required this.gifs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: gifs.length,
            itemBuilder: (context, index) {
              final item = gifs[index];

              return CachedNetworkImage(
                imageUrl: item.url,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<HomeBloc>().add(LoadMoreHomeEvent());
          },
          child: Text('loadMore'),
        ),
      ],
    );
  }
}
