import 'package:flutter_app/data/models/move.dart';
import 'package:flutter_app/data/models/versionGroupDetails.dart';

class Moves {
  Move move;
  List<VersionGroupDetails> versionGroupDetails;

  Moves.fromJsonMap(Map<String, dynamic> map) {
    if (map["move"] != null) {
      move = Move.fromJsonMap(map["move"]);
    }
    if (map["versionGroupDetails"] != null) {
      versionGroupDetails = List<VersionGroupDetails>.from(
          map["versionGroupDetails"]
              .map((it) => VersionGroupDetails.fromJsonMap(it)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['move'] = move == null ? null : move.toJson();
    data['versionGroupDetails'] = versionGroupDetails != null
        ? this.versionGroupDetails.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
