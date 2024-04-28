import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatefulWidget {
  const Episode(
      {super.key,
      required this.webtoonId,
      required this.episodeId,
      required this.title,
      required this.rating,
      required this.date});

  final String webtoonId, episodeId, title, rating, date;

  @override
  State<Episode> createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        children: [
          WebtoonEpisode(widget: widget),
          //   Text(widget.id),
          //   const SizedBox(
          //     height: 5,
          //   ),
          //   Text(widget.title),
          //   const SizedBox(
          //     height: 5,
          //   ),
          //   Text("${widget.rating} / ${widget.date}"),
        ],
      ),
    );
  }
}

class WebtoonEpisode extends StatelessWidget {
  const WebtoonEpisode({
    super.key,
    required this.widget,
  });

  final Episode widget;

  onButtonTap() async {
    // string을 Uri 형식으로 바꾸는 작업.
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=${widget.webtoonId}&no=${widget.episodeId}");
    // Future를 가져다주는 Function -> async, await 필요
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.5),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
