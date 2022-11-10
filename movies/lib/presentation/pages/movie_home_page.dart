import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:movies/movies.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieNowPlayingBloc>().add(OnMovieListCalled());
      context.read<MoviePopularBloc>().add(OnMoviePopularCalled());
      context.read<MovieTopRatedBloc>().add(OnMovieTopRatedCalled());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomDrawer(
        location: movieRoute,
        content: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text('Movies'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    searchMovieRoute,
                    arguments: true,
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              key: const Key('home_movie'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Now Playing',
                    style: kHeading6,
                  ),
                  BlocBuilder<MovieNowPlayingBloc, MovieNowPlayingState>(
                    builder: (context, state) {
                      if (state is MovieNowPlayingLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MovieNowPlayingHasData) {
                        final listMovie = state.result;
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final movie = listMovie[index];
                              return MovieList(
                                key: Key('now_play_$index'),
                                movies: movie,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    movieDetailRoute,
                                    arguments: movie.id,
                                  );
                                },
                              );
                            },
                            itemCount: listMovie.length,
                          ),
                        );
                      } else if (state is MovieNowPlayingError) {
                        return Text(
                          state.message,
                          key: const Key('error_message'),
                        );
                      } else {
                        return const Text(
                          'Failed',
                          key: Key('empty_message'),
                        );
                      }
                    },
                  ),
                  _buildSubHeading(
                      title: 'Popular',
                      onTap: () =>
                          Navigator.pushNamed(context, popularmovieRoute),
                      key: const Key('see_more_popular_movie')),
                  BlocBuilder<MoviePopularBloc, MoviePopularState>(
                    builder: (context, state) {
                      if (state is MoviePopularLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MoviePopularHasData) {
                        final listMovie = state.result;
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final movie = listMovie[index];
                              return MovieList(
                                key: Key('popular_$index'),
                                movies: movie,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    movieDetailRoute,
                                    arguments: movie.id,
                                  );
                                },
                              );
                            },
                            itemCount: listMovie.length,
                          ),
                        );
                      } else if (state is MoviePopularError) {
                        return Text(
                          state.message,
                          key: const Key('error_message'),
                        );
                      } else {
                        return const Text(
                          'Failed',
                          key: Key('empty_message'),
                        );
                      }
                    },
                  ),
                  _buildSubHeading(
                    title: 'Top Rated',
                    onTap: () =>
                        Navigator.pushNamed(context, topRatedmovieRoute),
                    key: const Key('see_more_top_rated_movie'),
                  ),
                  BlocBuilder<MovieTopRatedBloc, MovieTopRatedState>(
                    builder: (context, state) {
                      if (state is MovieTopRatedLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MovieTopRatedHasData) {
                        final listMovie = state.result;
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final movie = listMovie[index];
                              return MovieList(
                                key: Key('top_rated_$index'),
                                movies: movie,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    movieDetailRoute,
                                    arguments: movie.id,
                                  );
                                },
                              );
                            },
                            itemCount: listMovie.length,
                          ),
                        );
                      } else if (state is MovieTopRatedError) {
                        return Text(
                          state.message,
                          key: const Key('error_message'),
                        );
                      } else {
                        return const Text(
                          'Failed',
                          key: Key('empty_message'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({
    required String title,
    required Function() onTap,
    required Key key,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          key: key,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
