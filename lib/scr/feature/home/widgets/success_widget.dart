import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_bloc.dart';
import 'package:giphy_service/scr/feature/home/bloc/home_event.dart';
import 'package:giphy_service/scr/feature/home/widgets/details_page.dart';

class SuccessWidget extends StatelessWidget {
  final List<Gif> gifs;
  final bool isLoadingMore;

  const SuccessWidget({super.key, required this.gifs, required this.isLoadingMore});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;
        final isAtBottom = metrics.pixels >= metrics.maxScrollExtent - endOffset;

        if (isAtBottom && !isLoadingMore) context.read<HomeBloc>().add(LoadMoreHomeEvent());

        return false;
      },
      child: Column(
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

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage(gif: item)),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: item.url,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              },
            ),
          ),
          if (isLoadingMore)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('Loading more...'),
            ),
        ],
      ),
    );
  }

  static const endOffset = 100;
}
