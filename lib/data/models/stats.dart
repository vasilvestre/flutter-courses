import 'package:flutter_app/data/models/stat.dart';

class Stats {

  int baseStat;
  int effort;
  Stat stat;

	Stats.fromJsonMap(Map<String, dynamic> map): 
		baseStat = map["baseStat"],
		effort = map["effort"],
		stat = Stat.fromJsonMap(map["stat"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['baseStat'] = baseStat;
		data['effort'] = effort;
		data['stat'] = stat == null ? null : stat.toJson();
		return data;
	}
}
