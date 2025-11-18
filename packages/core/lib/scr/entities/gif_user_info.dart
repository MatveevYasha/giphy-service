import 'package:flutter/foundation.dart';

@immutable
class GifUserInfo {
  final String? name;
  final String? description;
  final bool? isVerified;

  const GifUserInfo({
    required this.name,
    required this.description,
    required this.isVerified,
  });

  @override
  int get hashCode => Object.hashAll([
        name,
        description,
        isVerified,
      ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GifUserInfo) return false;

    return other.name == name && other.description == description && other.isVerified == isVerified;
  }
}
