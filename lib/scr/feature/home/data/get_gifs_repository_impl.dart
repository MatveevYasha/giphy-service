import 'package:core/core.dart';

class GetGifsRepositoryImpl implements GetGifsRepository {
  final GetGifsProvider _provider;

  const GetGifsRepositoryImpl({required GetGifsProvider provider}) : _provider = provider;

  @override
  Future<List<Gif>> getGifs() => _provider.getGifts();
}
