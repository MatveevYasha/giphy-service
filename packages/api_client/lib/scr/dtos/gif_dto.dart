import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gif_dto.g.dart';

typedef Json = Map<String, Object?>;

@JsonSerializable(createToJson: false)
class GifDTO {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'url')
  final String url;

  const GifDTO({
    required this.id,
    required this.url,
  });

  factory GifDTO.fromJson(Json json) => _$GifDTOFromJson(json);

  Gif toEntity() {
    return Gif(
      id: id,
      url: url,
    );
  }
}
