class WebtoonEpisodeModel {
  final String episodeId, title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : episodeId = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
