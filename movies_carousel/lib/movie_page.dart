import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_carousel/movie_cubit/movie_page_cubit.dart';

import 'movie_card.dart';
import 'movie_cover_image.dart';
import 'movie_model.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoviePageCubit(),
      child: Builder(
        builder: (ctx) => _buildScaffold(ctx),
      ),
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BlocBuilder<MoviePageCubit, MoviePageState>(builder: (_, state) {
              return MovieCoverImage(pic: movies[state.index()].pic);
            }),
            _linearGradient(),
            _carouselSlider(context),
          ],
        ),
      ),
    );
  }

  Positioned _linearGradient() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.grey.shade50.withOpacity(1),
              Colors.grey.shade50.withOpacity(1),
              Colors.grey.shade50.withOpacity(1),
              Colors.grey.shade50.withOpacity(1),
              Colors.grey.shade50.withOpacity(0.0),
              Colors.grey.shade50.withOpacity(0.0),
              Colors.grey.shade50.withOpacity(0.0),
              Colors.grey.shade50.withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _carouselSlider(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      height: MediaQuery.of(context).size.height * 0.7,
      child: CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (context, index, realIndex) {
          return MovieCard(model: movies[index]);
        },
        options: CarouselOptions(
          height: 500,
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
          onPageChanged: (index, _) {
            context.read<MoviePageCubit>().change(index);
          },
        ),
      ),
    );
  }
}
