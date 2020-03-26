import 'package:flutter_app/data/models/moveLearnMethod.dart';
import 'package:flutter_app/data/models/versionGroup.dart';

class VersionGroupDetails {
  int levelLearnedAt;
  MoveLearnMethod moveLearnMethod;
  VersionGroup versionGroup;

  VersionGroupDetails.fromJsonMap(Map<String, dynamic> map)
      : levelLearnedAt = map["levelLearnedAt"],
        moveLearnMethod = MoveLearnMethod.fromJsonMap(map["moveLearnMethod"]),
        versionGroup = VersionGroup.fromJsonMap(map["versionGroup"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['levelLearnedAt'] = levelLearnedAt;
    data['moveLearnMethod'] =
        moveLearnMethod == null ? null : moveLearnMethod.toJson();
    data['versionGroup'] = versionGroup == null ? null : versionGroup.toJson();
    return data;
  }
}
