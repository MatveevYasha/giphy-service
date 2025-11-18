import '../../entities/gif.dart';

abstract interface class GifsProvider {
  Future<List<Gif>> getGifts({required int limit, int? offset});

  Future<List<Gif>> searchGifts({required String searchString, required int limit, int? offset});
}
