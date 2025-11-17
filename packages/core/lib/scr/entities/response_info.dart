import 'package:core/scr/entities/gif.dart';
import 'package:core/scr/entities/meta_info.dart';
import 'package:core/scr/entities/pagination_info.dart';
import 'package:flutter/foundation.dart';

@immutable
class ResponseInfo {
  final List<Gif> gifs;
  final MetaInfo metaInfo;
  final PaginationInfo paginationInfo;

  const ResponseInfo({
    required this.gifs,
    required this.metaInfo,
    required this.paginationInfo,
  });

  @override
  int get hashCode => Object.hashAll([gifs, metaInfo, paginationInfo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResponseInfo) return false;

    return other.gifs == gifs &&
        other.metaInfo == metaInfo &&
        other.paginationInfo == paginationInfo;
  }
}
