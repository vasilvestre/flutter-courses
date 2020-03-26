import 'package:dio/dio.dart';
import 'package:flutter_app/models/rickAndMortyResultList.dart';

class RickAndMortyProvider {
  static const String BASE_API = 'https://rickandmortyapi.com/api/';

  Future<RickAndMortyResultList> getAll(page) async {
    var dio = Dio();
    Response rickandmortyResponse =
    await dio.get(BASE_API + 'character'+"?page="+page.toString());
    return RickAndMortyResultList.fromJson(rickandmortyResponse.data);
  }
}
