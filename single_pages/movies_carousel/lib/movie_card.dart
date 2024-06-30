import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'movie_cover_image.dart';
import 'movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.model});

  final MovieModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              // child: Image.network(
              //   model.pic,
              //   fit: BoxFit.cover,
              // ),
              child: MovieCoverImage(pic: model.pic),
            ),
            const SizedBox(height: 20),
            Text(model.title, overflow: TextOverflow.ellipsis)
                .fontSize(16)
                .fontWeight(FontWeight.bold),
            const SizedBox(height: 15),
            Text(model.desc, overflow: TextOverflow.ellipsis)
                .fontSize(14)
                .textColor(Colors.grey.shade600),
            const SizedBox(height: 20),
            _movieDataView(),
          ],
        ),
      ),
    );
  }

  Widget _movieDataView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconWithText(
          icon: Icons.star,
          color: Colors.yellow,
          desc: '4.5',
        ),
        IconWithText(
          icon: Icons.access_time,
          color: Colors.grey.shade600,
          desc: '2h',
        ),
        IconWithText(
          icon: Icons.play_circle_filled,
          color: Colors.grey.shade600,
          desc: 'Watch',
        ),
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.icon,
    required this.color,
    required this.desc,
  });

  final IconData icon;
  final Color color;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(desc).fontSize(14).textColor(Colors.grey.shade600),
      ],
    );
  }
}
