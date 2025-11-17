import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_dto.g.dart';

typedef Json = Map<String, Object?>;

@JsonSerializable(createToJson: false)
class MetaDTO {
  @JsonKey(name: 'status')
  final int responseCode;

  const MetaDTO({required this.responseCode});

  factory MetaDTO.fromJson(Json json) => _$MetaDTOFromJson(json);

  MetaInfo toEntity() => MetaInfo(responseCode: responseCode);
}
