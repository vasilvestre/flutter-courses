import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_app/data/models/pokemon.dart';
import 'package:flutter_app/data/models/pokemonListResponse.dart';

class PokemonProvider {
  static const String BASE_API = 'https://pokeapi.co/api/v2';
  static const int ITEM_PER_PAGE = 50;

  Future<Pokemon> getRandomPokemon() async {
    var rng = new Random();
    var dio = Dio();
    Response pokemonResponse =
        await dio.get(BASE_API + '/pokemon/' + rng.nextInt(807).toString());
    return Pokemon.fromJsonMap(pokemonResponse.data);
  }

  Future<Pokemon> getPokemon(String url) async {
    var dio = Dio();
    Response pokemonResponse = await dio.get(url);
    return Pokemon.fromJsonMap(pokemonResponse.data);
  }

  Future<PokemonListResponse> getPokemons() async {
    var dio = Dio();
    Response pokemonListResponse = await dio
        .get(BASE_API + '/pokemon/', queryParameters: {'limit': ITEM_PER_PAGE});
    return PokemonListResponse.fromJsonMap(pokemonListResponse.data);
  }
}
