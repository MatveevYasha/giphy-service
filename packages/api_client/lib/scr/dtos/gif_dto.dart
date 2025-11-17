import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gif_dto.g.dart';

typedef Json = Map<String, Object?>;

@JsonSerializable(createToJson: false)
class GifDTO {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(readValue: _readGifUrl)
  final String url;

  const GifDTO({
    required this.id,
    required this.url,
  });

  factory GifDTO.fromJson(Json json) => _$GifDTOFromJson(json);

  static Object? _readGifUrl(Map json, String key) {
    return json['images']?['original']?['url'];
  }

  Gif toEntity() {
    return Gif(
      id: id,
      url: url,
    );
  }
}
