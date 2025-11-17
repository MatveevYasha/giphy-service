import '../../entities/gif.dart';

abstract interface class GetGifsRepository {
  Future<List<Gif>> getGifs();
}
