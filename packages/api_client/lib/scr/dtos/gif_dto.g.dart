// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifDTO _$GifDTOFromJson(Map<String, dynamic> json) => GifDTO(
      id: json['id'] as String,
      url: GifDTO._readGifUrl(json, 'url') as String,
      userInfo: json['user'] == null
          ? null
          : GifUserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );
