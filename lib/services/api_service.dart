import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // response.body가 string 형이지만, 본래 format이 JSON이기에 JSON으로 바꿔줘야 한다.
      final dynamic webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // add로 그냥 webtoon을 넣어주면 Map형식이 들어간다. 하지만 webtoonInstance가 필요한건 WebtoonModel 클래스이다.
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    // 오류 발생시 Error함수 실행
    throw Error();
  }
}
