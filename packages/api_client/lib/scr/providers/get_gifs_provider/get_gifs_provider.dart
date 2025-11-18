import 'package:dio/dio.dart';
import 'package:core/core.dart';

import '../../dtos/response_dto.dart';

final _dio = Dio();
const String _apiKey = 'ttlJ43eroz5ta9kl7biNLLjjduvv8V5y';

class ApiGifsProvider implements GetGifsProvider {
  @override
  Future<List<Gif>> getGifts({required int limit, int? offset = 0}) async {
    try {
      final responseData = await _dio.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=$_apiKey&limit=$limit&offset=$offset&rating=g&bundle=messaging_non_clips');

      final responseJson = responseData.data;
      final response = ResponseDTO.fromJson(responseJson).toEntity();
      final responseCode = response.metaInfo.responseCode;

      if (responseCode != 200) throw Exception();

      return response.gifs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
