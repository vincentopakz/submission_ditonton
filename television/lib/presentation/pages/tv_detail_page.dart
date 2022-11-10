import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:core/core.dart';
import 'package:television/television.dart';

class TVDetailPage extends StatefulWidget {
  final int id;
  const TVDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TVDetailPageState createState() => _TVDetailPageState();
}

class _TVDetailPageState extends State<TVDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvDetailBloc>().add(OnTvDetailCalled(widget.id));
      context
          .read<TvRecommendationBloc>()
          .add(OnTvRecommendationCalled(widget.id));
      context.read<TvWatchlistBloc>().add(FetchTvWatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAddedToWatchlist = context.select<TvWatchlistBloc, bool>((bloc) =>
        (bloc.state is TvIsAddedToWatchlist)
            ? (bloc.state as TvIsAddedToWatchlist).isAdded
            : false);
    return Scaffold(
      body: BlocBuilder<TvDetailBloc, TvDetailState>(
        builder: (context, state) {
          if (state is TvDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvDetailHasData) {
            final tv = state.result;
            return SafeArea(
              child: DetailContent(
                isAddedToWatchlist,
                tv: tv,
              ),
            );
          } else if (state is TvDetailError) {
            return Center(
              child: Text(
                state.message,
                key: const Key('error_message'),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Detail is empty',
                key: Key('empty_message'),
              ),
            );
          }
        },
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final TVDetail tv;
  bool isAddedWatchlist;

  DetailContent(
    this.isAddedWatchlist, {
    Key? key,
    required this.tv,
  }) : super(key: key);

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  final messageWatchlistAddSuccess = 'Added to Watchlist';
  final messageWatchlistRemoveSuccess = 'Removed from Watchlist';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$BASE_IMAGE_URL${widget.tv.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tv.name,
                              style: kHeading5,
                            ),
                            if (widget.tv.inProduction)
                              const Text(
                                "Ongoing",
                              ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!widget.isAddedWatchlist) {
                                  context
                                      .read<TvWatchlistBloc>()
                                      .add(AddTvToWatchlist(widget.tv));
                                } else {
                                  context
                                      .read<TvWatchlistBloc>()
                                      .add(RemoveTvFromWatchlist(widget.tv));
                                }

                                final message = context.select<TvWatchlistBloc,
                                    String>((value) => (value
                                        .state is TvIsAddedToWatchlist)
                                    ? (value.state as TvIsAddedToWatchlist)
                                                .isAdded ==
                                            false
                                        ? messageWatchlistAddSuccess
                                        : messageWatchlistRemoveSuccess
                                    : !widget.isAddedWatchlist
                                        ? messageWatchlistAddSuccess
                                        : messageWatchlistRemoveSuccess);

                                if (message == messageWatchlistAddSuccess ||
                                    message == messageWatchlistRemoveSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }

                                setState(() {
                                  widget.isAddedWatchlist =
                                      !widget.isAddedWatchlist;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  widget.isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(widget.tv.genres),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.tv.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.tv.voteAverage}')
                              ],
                            ),
                            if (widget.tv.firstAirDate != null)
                              Text('Aired on ${widget.tv.firstAirDate}'),
                            const SizedBox(height: 8),
                            Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.grey.withOpacity(.2)),
                            const SizedBox(height: 8),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              widget.tv.overview.length < 3
                                  ? "-"
                                  : widget.tv.overview,
                            ),
                            const SizedBox(height: 16),
                            const SizedBox(height: 16),
                            BlocBuilder<TvRecommendationBloc,
                                    TvRecommendationState>(
                                builder: (context, state) {
                              if (state is TvRecommendationLoading ||
                                  state is TvRecommendationHasData) {
                                return Text(
                                  'Recommendations',
                                  style: kHeading6,
                                );
                              } else {
                                return const SizedBox();
                              }
                            }),
                            BlocBuilder<TvRecommendationBloc,
                                TvRecommendationState>(
                              builder: (context, state) {
                                if (state is TvRecommendationLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is TvRecommendationHasData) {
                                  final listTv = state.result;
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tv = listTv[index];
                                        return TVListLayout(
                                          key: Key('recom_$index'),
                                          tv: tv,
                                          onTap: () {
                                            Navigator.pushReplacementNamed(
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
                                } else if (state is TvRecommendationError) {
                                  return Center(
                                    child: Text(
                                      state.message,
                                      key: const Key('No similar recommendation currently'),
                                    ),
                                  );
                                } else {
                                  return const SizedBox(
                                    key: Key('empty_recom'),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
