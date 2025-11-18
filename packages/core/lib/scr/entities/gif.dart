import 'package:core/scr/entities/gif_user_info.dart';
import 'package:flutter/foundation.dart';

typedef GifId = String;

@immutable
class Gif {
  final GifId id;
  final String url;
  final GifUserInfo? userInfo;

  const Gif({
    required this.id,
    required this.url,
    required this.userInfo,
  });

  @override
  int get hashCode => Object.hashAll([id, url, userInfo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Gif) return false;

    return other.id == id && other.url == url && other.userInfo == userInfo;
  }
}
