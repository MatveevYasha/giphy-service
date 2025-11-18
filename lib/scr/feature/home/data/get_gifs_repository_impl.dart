import 'package:core/core.dart';

class GetGifsRepositoryImpl implements GetGifsRepository {
  final GetGifsProvider _provider;

  const GetGifsRepositoryImpl({required GetGifsProvider provider}) : _provider = provider;

  @override
  Future<List<Gif>> getGifs({required int limit, int? offset}) =>
      _provider.getGifts(limit: limit, offset: offset);
}
