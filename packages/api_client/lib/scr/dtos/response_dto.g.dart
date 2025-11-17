// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDTO _$ResponseDTOFromJson(Map<String, dynamic> json) => ResponseDTO(
      gifs: (json['data'] as List<dynamic>)
          .map((e) => GifDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      metaInfo: MetaDTO.fromJson(json['meta'] as Map<String, dynamic>),
      paginationInfo:
          PaginationDTO.fromJson(json['pagination'] as Map<String, dynamic>),
    );
