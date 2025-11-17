import 'package:api_client/scr/dtos/gif_dto.dart';
import 'package:api_client/scr/dtos/meta_dto.dart';
import 'package:api_client/scr/dtos/pagination_dto.dart';
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_dto.g.dart';

typedef Json = Map<String, Object?>;

@JsonSerializable(createToJson: false)
class ResponseDTO {
  @JsonKey(name: 'data')
  final List<GifDTO> gifs;

  @JsonKey(name: 'meta')
  final MetaDTO metaInfo;

  @JsonKey(name: 'pagination')
  final PaginationDTO paginationInfo;

  const ResponseDTO({
    required this.gifs,
    required this.metaInfo,
    required this.paginationInfo,
  });

  factory ResponseDTO.fromJson(Json json) => _$ResponseDTOFromJson(json);

  ResponseInfo toEntity() {
    return ResponseInfo(
      gifs: gifs.map((e) => e.toEntity()).toList(),
      metaInfo: metaInfo.toEntity(),
      paginationInfo: paginationInfo.toEntity(),
    );
  }
}
