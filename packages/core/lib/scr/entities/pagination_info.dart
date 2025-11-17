import 'package:flutter/foundation.dart';

@immutable
class PaginationInfo {
  final int totalCount;
  final int count;
  final int offset;

  const PaginationInfo({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  @override
  int get hashCode => Object.hashAll([totalCount, count]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaginationInfo) return false;

    return other.totalCount == totalCount && other.count == count && other.offset == offset;
  }
}
