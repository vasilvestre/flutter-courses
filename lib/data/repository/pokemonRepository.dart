import 'package:flutter_app/data/models/pokemonListResponse.dart';
import 'package:flutter_app/data/provider/pokemonProvider.dart';

class PokemonRepository {
  Future<PokemonListResponse> getAll() => PokemonProvider().getPokemons();
}
