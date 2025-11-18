import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/scr/entities/gif.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Gif gif;

  const DetailsPage({super.key, required this.gif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: gif.url,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            if (gif.userInfo != null) ...[
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  gif.userInfo?.name ?? '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(gif.userInfo?.description ?? '', style: TextStyle(fontSize: 14)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
