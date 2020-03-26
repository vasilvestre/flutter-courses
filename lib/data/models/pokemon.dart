import 'package:flutter_app/data/models/abilities.dart';
import 'package:flutter_app/data/models/forms.dart';
import 'package:flutter_app/data/models/moves.dart';
import 'package:flutter_app/data/models/species.dart';
import 'package:flutter_app/data/models/sprites.dart';
import 'package:flutter_app/data/models/stats.dart';
import 'package:flutter_app/data/models/types.dart';

class Pokemon {
  List<Abilities> abilities;
  int baseExperience;
  List<Forms> forms;
  List<Object> gameIndices;
  int height;
  List<Object> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Moves> moves;
  String name;
  int order;
  Species species;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;

  Pokemon.fromJsonMap(Map<String, dynamic> map) {
    if (map["abilities"] != null) {
      abilities = List<Abilities>.from(
          map["abilities"].map((it) => Abilities.fromJsonMap(it)));
    }
    if (map["base_experience"] != null) {
      baseExperience = map["base_experience"];
    }
    if (map["forms"] != null) {
      forms = List<Forms>.from(map["forms"].map((it) => Forms.fromJsonMap(it)));
    }
    if (map["game_indices"] != null) {
      gameIndices = map["game_indices"];
    }
    if (map["height"] != null) {
      height = map["height"];
    }
    if (map["heldItems"] != null) {
      heldItems = map["held_items"];
    }
    if (map["id"] != null) {
      id = map["id"];
    }
    if (map["is_default"] != null) {
      isDefault = map["is_default"];
    }
    if (map["locationAreaEncounters"] != null) {
      locationAreaEncounters = map["location_area_encounters"];
    }
    if (map["moves"] != null) {
      moves = List<Moves>.from(map["moves"].map((it) => Moves.fromJsonMap(it)));
    }
    if (map["name"] != null) {
      name = map["name"];
    }
    if (map["order"] != null) {
      order = map["order"];
    }
    if (map["species"] != null) {
      species = Species.fromJsonMap(map["species"]);
    }
    if (map["sprites"] != null) {
      sprites = Sprites.fromJsonMap(map["sprites"]);
    }
    if (map["stats"] != null) {
      stats = List<Stats>.from(map["stats"].map((it) => Stats.fromJsonMap(it)));
    }
    if (map["types"] != null) {
      types = List<Types>.from(map["types"].map((it) => Types.fromJsonMap(it)));
    }
    if (map["weight"] != null) {
      weight = map["weight"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abilities'] = abilities != null
        ? this.abilities.map((v) => v.toJson()).toList()
        : null;
    data['baseExperience'] = baseExperience;
    data['forms'] =
        forms != null ? this.forms.map((v) => v.toJson()).toList() : null;
    data['gameIndices'] = gameIndices;
    data['height'] = height;
    data['heldItems'] = heldItems;
    data['id'] = id;
    data['isDefault'] = isDefault;
    data['locationAreaEncounters'] = locationAreaEncounters;
    data['moves'] =
        moves != null ? this.moves.map((v) => v.toJson()).toList() : null;
    data['name'] = name;
    data['order'] = order;
    data['species'] = species == null ? null : species.toJson();
    data['sprites'] = sprites == null ? null : sprites.toJson();
    data['stats'] =
        stats != null ? this.stats.map((v) => v.toJson()).toList() : null;
    data['types'] =
        types != null ? this.types.map((v) => v.toJson()).toList() : null;
    data['weight'] = weight;
    return data;
  }
}
