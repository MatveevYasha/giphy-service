import 'package:dio/dio.dart';
import 'package:core/core.dart';

import '../../dtos/gif_dto.dart';

final _dio = Dio();
const String _apiKey = 'ttlJ43eroz5ta9kl7biNLLjjduvv8V5y';
const int _limit = 10;

class ApiGifsProvider implements GetGifsProvider {
  @override
  Future<List<Gif>> getGifts() async {
    final response = await _dio.get(
        'https://api.giphy.com/v1/gifs/trending?api_key=$_apiKey&limit=$_limit&offset=0&rating=g&bundle=messaging_non_clips');

    final List<Gif> list = [];

    final listJson = List.castFrom<dynamic, Json>(response.data);

    for (var gifJson in listJson) {
      final gifEntity = await GifDTO.fromJson(gifJson).toEntity();

      list.add(gifEntity);
    }

    return list;
  }
}
