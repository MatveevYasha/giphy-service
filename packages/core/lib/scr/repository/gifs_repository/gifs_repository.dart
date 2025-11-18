import '../../entities/gif.dart';

abstract interface class GifsRepository {
  Future<List<Gif>> getGifs({required int limit, int? offset});

  Future<List<Gif>> searchGifts({required String searchString, required int limit, int? offset});
}
