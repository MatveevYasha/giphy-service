import 'package:flutter/foundation.dart';

@immutable
class MetaInfo {
  final int responseCode;

  const MetaInfo({
    required this.responseCode,
  });

  @override
  int get hashCode => Object.hashAll([responseCode]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MetaInfo) return false;

    return other.responseCode == responseCode;
  }
}
