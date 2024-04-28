import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});
  final String title, thumb, id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // 우리가 지금 여기서 할 수 있는 것은 오직 초기화이지, 다른 인자(id)를 외부에서 갖고올 수 없다.
  // 외부에서 갖고오기 위해선 stateless -> stateful widget으로 바꿔야 한다.
  // Future<WebtoonDetailModel> webtoon = ApiService.getToonById(widget.id);

  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> webtoonEpisode;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    // instance 생성 -> 사용자의 저장소와의 connection이 생겼다.
    prefs = await SharedPreferences.getInstance();
    // 처음에는 string형 list가 있을 수도, 없을 수(사용자가 처음 실행)도 있다.
    // 'likedToons'이라는 key를 가진 String list를 갖고와라
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      } else {
        setState(() {
          isLiked = false;
        });
      }
    } else {
      // Future이기 때문에 기다려야 한다.
      await prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    webtoonEpisode = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      // 하트 눌렀는데 한번 더 누름 -> 지워
      if (isLiked) {
        likedToons.remove(widget.id);
        print(likedToons);
      } else {
        likedToons.add(widget.id);
        print(likedToons);
      }
      // set을 하기 위해서는 항상 await가 필요하다.
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_outline_outlined),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
                  child: Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            // 그림자를 얼마나 드리울 것인가?
                            blurRadius: 15,
                            // 그림자의 위치
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ]),
                    child: Image.network(
                      widget.thumb,
                      headers: const {
                        // User Agent를 웹브라우저에서 쓰는 것으로 초기화 시키지 않는다면 네이버가 봇 차단으로 403 error가 발생.
                        "User-Agent":
                            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              // future: 무엇이 나중에 들어올 객체인가?
              future: webtoon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${snapshot.data!.genre} / ${snapshot.data!.age}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                }
                return const Text("기다려줘잉");
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: webtoonEpisode,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Flexible(child: makeListEpisode(snapshot, widget.id));
                }
                return const Text('에피소드가 안보여..');
              },
            )
          ],
        ),
      ),
    );
  }

  ListView makeListEpisode(
      AsyncSnapshot<List<WebtoonEpisodeModel>> snapshot, String webtoonId) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemBuilder: (context, index) {
        var episode = snapshot.data![index];
        return Episode(
            webtoonId: webtoonId,
            episodeId: episode.episodeId,
            title: episode.title,
            rating: episode.rating,
            date: episode.date);
      },
    );
  }
}
