import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_dto.g.dart';

typedef Json = Map<String, Object?>;

@JsonSerializable(createToJson: false)
class PaginationDTO {
  @JsonKey(name: 'total_count')
  final int totalCount;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'offset')
  final int offset;

  const PaginationDTO({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  factory PaginationDTO.fromJson(Json json) => _$PaginationDTOFromJson(json);

  PaginationInfo toEntity() {
    return PaginationInfo(
      totalCount: totalCount,
      count: count,
      offset: offset,
    );
  }
}
