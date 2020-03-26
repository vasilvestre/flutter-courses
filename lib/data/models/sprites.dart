class Sprites {
  Object backDefault;
  Object backFemale;
  Object backShiny;
  Object backShinyFemale;
  Object frontDefault;
  Object frontFemale;
  Object frontShiny;
  Object frontShinyFemale;

  Sprites.fromJsonMap(Map<String, dynamic> map) {
    backDefault = map["backDefault"] ?? null;
    backFemale = map["backFemale"] ?? null;
    backShiny = map["backShiny"] ?? null;
    backShinyFemale = map["backShinyFemale"] ?? null;
    frontDefault = map["front_default"] ?? null;
    frontFemale = map["front_female"] ?? null;
    frontShiny = map["frontShiny"] ?? null;
    frontShinyFemale = map["frontShinyFemale"] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backDefault'] = backDefault ?? '';
    data['backFemale'] = backFemale ?? '';
    data['backShiny'] = backShiny ?? '';
    data['backShinyFemale'] = backShinyFemale ?? '';
    data['frontDefault'] = frontDefault ?? '';
    data['frontFemale'] = frontFemale ?? '';
    data['frontShiny'] = frontShiny ?? '';
    data['frontShinyFemale'] = frontShinyFemale ?? '';
    return data;
  }
}
