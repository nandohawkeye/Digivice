class DigimonModel {
  String? _name;
  String? _level;
  String? _image;

  String get name => _name ?? '';
  String get level => _level ?? '';
  String get image => _image ?? '';

  DigimonModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'] as String;
    _level = json['level'] as String;
    _image = json['img'] as String;
  }
}
