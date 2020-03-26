import 'package:flutter_app/data/models/pokemonListResult.dart';

class PokemonListResponse {
  int count;
  String next;
  Object previous;
  List<PokemonListResult> results;

  PokemonListResponse.fromJsonMap(Map<String, dynamic> map)
      : count = map["count"],
        next = map["next"],
        previous = map["previous"],
        results = List<PokemonListResult>.from(
            map["results"].map((it) => PokemonListResult.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    data['results'] =
        results != null ? this.results.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
