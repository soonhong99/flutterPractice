class WebtoonDetailModel {
  final String title, about, genre, age;

  // Named Constructor
  // 다른 곳에서 이렇게 class를 초기화하면 안에 있는 property들은 json에 위치한 각각의 value들과 같다.
  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
