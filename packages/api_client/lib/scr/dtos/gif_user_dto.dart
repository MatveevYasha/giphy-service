import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gif_user_dto.g.dart';

typedef Json = Map<String, Object?>;

@JsonSerializable(createToJson: false)
class GifUserDTO {
  @JsonKey(name: 'display_name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'is_verified')
  final bool? isVerified;

  const GifUserDTO({
    required this.name,
    required this.description,
    required this.isVerified,
  });

  factory GifUserDTO.fromJson(Json json) => _$GifUserDTOFromJson(json);

  GifUserInfo toEntity() {
    return GifUserInfo(
      name: name,
      description: description,
      isVerified: isVerified,
    );
  }
}
