class WebtoonModel {
  final String title, thumb, id;

  // key 값: String, Value 값 : dynamic
  // named Constructor - fromJson
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
