import 'package:flutter_app/data/models/ability.dart';

class Abilities {

  Ability ability;
  bool isHidden;
  int slot;

	Abilities.fromJsonMap(Map<String, dynamic> map): 
		ability = Ability.fromJsonMap(map["ability"]),
		isHidden = map["isHidden"],
		slot = map["slot"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['ability'] = ability == null ? null : ability.toJson();
		data['isHidden'] = isHidden;
		data['slot'] = slot;
		return data;
	}
}
