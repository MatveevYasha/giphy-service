import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  final List<Gif> gifs;

  const SuccessWidget({super.key, required this.gifs});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: gifs.length,
      itemBuilder: (context, index) {
        final item = gifs[index];

        return Center(child: Text(item.url));
      },
    );
  }
}
