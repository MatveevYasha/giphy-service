import 'package:flutter/foundation.dart';

typedef GifId = String;

@immutable
class Gif {
  final GifId id;
  final String url;

  const Gif({
    required this.id,
    required this.url,
  });

  @override
  int get hashCode => Object.hashAll([id, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Gif) return false;

    return other.id == id && other.url == url;
  }
}
