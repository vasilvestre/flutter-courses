class Type {
  String name;
  String url;

  Type.fromJsonMap(Map<String, dynamic> map)
      : name = map["name"] != null ? map["name"] : null,
        url = map["url"] != null ? map["url"] : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
