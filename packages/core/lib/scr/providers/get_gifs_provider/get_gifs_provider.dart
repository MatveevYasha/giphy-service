import '../../entities/gif.dart';

abstract interface class GetGifsProvider {
  Future<List<Gif>> getGifts();
}
