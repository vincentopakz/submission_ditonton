import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:television/television.dart';

class WatchlistTVPage extends StatefulWidget {
  const WatchlistTVPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WatchlistTVPageState createState() => _WatchlistTVPageState();
}

class _WatchlistTVPageState extends State<WatchlistTVPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvWatchlistBloc>().add(OnFetchTvWatchlist());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<TvWatchlistBloc>().add(OnFetchTvWatchlist());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomDrawer(
        location: watchlistTVRoute,
        content: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text('Watchlist TV Shows'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              key: const Key('watchlist_page'),
              child: BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
                builder: (context, state) {
                  if (state is TvWatchlistLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvWatchlistHasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final tv = state.result[index];
                        return TVShowCard(
                          key: Key('tv_card_$index'),
                          tv: tv,
                          isWatchlist: true,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              tvDetailRoute,
                              arguments: tv.id,
                            );
                          },
                        );
                      },
                      itemCount: state.result.length,
                    );
                  } else if (state is TvWatchlistError) {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.message),
                    );
                  } else {
                    return const Center(
                      key: Key('empty_data'),
                      child: Text('Empty'),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
