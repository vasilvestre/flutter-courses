
import 'package:flutter_app/data/provider/RickAndMortyProvider.dart';
import 'package:flutter_app/models/rickAndMortyResultList.dart';

class RickAndMortyRepository {
  Future<RickAndMortyResultList> getAll(int page) => RickAndMortyProvider().getAll(page);
}