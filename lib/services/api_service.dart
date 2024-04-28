import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // response.body가 string 형이지만, 본래 format이 JSON이기에 JSON으로 바꿔줘야 한다.
      final dynamic webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        // add로 그냥 webtoon을 넣어주면 Map형식이 들어간다. 하지만 webtoonInstance가 필요한건 WebtoonModel 클래스이다.
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    // 오류 발생시 Error함수 실행
    throw Error();
  }

  // 왜 리스트 형식이 아니야? 안에서 id를 입력하면 해당 웹툰 id에 맞는 정보들만 나오기 때문이다.
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic webtoon = jsonDecode(response.body);
      var idWebtoonDetail = WebtoonDetailModel.fromJson(webtoon);
      return idWebtoonDetail;
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        var webtoonEpisode = WebtoonEpisodeModel.fromJson(episode);
        episodesInstances.add(webtoonEpisode);
      }
      return episodesInstances;
    }
    throw Error();
  }
}
