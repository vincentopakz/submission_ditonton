import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:television/television.dart';

class TVHomePage extends StatefulWidget {
  const TVHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TVHomePageState createState() => _TVHomePageState();
}

class _TVHomePageState extends State<TVHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvListBloc>().add(OnTvShowListCalled());
      context.read<TvPopularBloc>().add(OnTvPopularCalled());
      context.read<TvTopRatedBloc>().add(OnTvTopRatedCalled());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomDrawer(
        location: tvRoute,
        content: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text('TV Show'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    searchTVRoute,
                    arguments: false,
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              key: const Key('home_tv'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'On The Air',
                    style: kHeading6,
                  ),
                  BlocBuilder<TvListBloc, TvListState>(
                    builder: (context, state) {
                      if (state is TvListLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TvListHasData) {
                        final listTv = state.result;
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final tv = listTv[index];
                              return TVListLayout(
                                key: Key('ota_$index'),
                                tv: tv,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    tvDetailRoute,
                                    arguments: tv.id,
                                  );
                                },
                              );
                            },
                            itemCount: listTv.length,
                          ),
                        );
                      } else if (state is TvListError) {
                        return Center(
                          child: Text(
                            state.message,
                            key: const Key('error_message'),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'There are no tv show currently',
                            key: Key('empty_message'),
                          ),
                        );
                      }
                    },
                  ),
                  _buildSubHeading(
                      title: 'Popular TV Shows',
                      onTap: () {
                        Navigator.pushNamed(context, popularTVRoute);
                      },
                      key: 'see_more_popular_tv'),
                  BlocBuilder<TvPopularBloc, TvPopularState>(
                    builder: (context, state) {
                      if (state is TvPopularLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TvPopularHasData) {
                        final listTv = state.result;
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final tv = listTv[index];
                              return TVListLayout(
                                key: Key('popular_$index'),
                                tv: tv,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    tvDetailRoute,
                                    arguments: tv.id,
                                  );
                                },
                              );
                            },
                            itemCount: listTv.length,
                          ),
                        );
                      } else if (state is TvPopularError) {
                        return Center(
                          child: Text(
                            state.message,
                            key: const Key('error_message'),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'There are no tv popular',
                            key: Key('empty_message'),
                          ),
                        );
                      }
                    },
                  ),
                  _buildSubHeading(
                      title: 'Top Rated',
                      onTap: () {
                        Navigator.pushNamed(context, topRatedTVRoute);
                      },
                      key: 'see_more_top_rated_tv'),
                  BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
                    builder: (context, state) {
                      if (state is TvTopRatedLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TvTopRatedHasData) {
                        final listTv = state.result;
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final tv = listTv[index];
                              return TVListLayout(
                                key: Key('top_rated_$index'),
                                tv: tv,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    tvDetailRoute,
                                    arguments: tv.id,
                                  );
                                },
                              );
                            },
                            itemCount: listTv.length,
                          ),
                        );
                      } else if (state is TvTopRatedError) {
                        return Center(
                          child: Text(
                            state.message,
                            key: const Key('error_message'),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'There are no tv top rated showing',
                            key: Key('empty_message'),
                          ),
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
    required String key,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              key: Key(key),
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
