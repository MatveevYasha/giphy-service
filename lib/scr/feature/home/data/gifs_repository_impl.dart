import 'package:core/core.dart';

class GifsRepositoryImpl implements GifsRepository {
  final GifsProvider _provider;

  const GifsRepositoryImpl({required GifsProvider provider}) : _provider = provider;

  @override
  Future<List<Gif>> getGifs({required int limit, int? offset}) =>
      _provider.getGifts(limit: limit, offset: offset);

  @override
  Future<List<Gif>> searchGifts({required String searchString, required int limit, int? offset}) =>
      _provider.searchGifts(searchString: searchString, limit: limit, offset: offset);
}
