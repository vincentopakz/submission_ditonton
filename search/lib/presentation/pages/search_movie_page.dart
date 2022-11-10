import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:movies/movies.dart';
import 'package:search/search.dart';

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        key: const Key('ini_search_page'),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              key: const Key('movie_text_field'),
              onChanged: (query) {
                context
                    .read<SearchMoviesBloc>()
                    .add(OnQueryMoviesChange(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search Movies Title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
              builder: (context, state) {
                if (state is SearchMoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchMoviesHasData) {
                  final result = state.result;
                  return Expanded(
                    child: result.isEmpty
                        ? Center(
                            child: Text(
                              'Nggak ketemu nih,\ncoba yang lain?',
                              style: kHeading6,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return MovieCard(
                                key: Key('movie_card_$index'),
                                movie: movie,
                                isWatchlist: false,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    movieDetailRoute,
                                    arguments: movie.id,
                                  );
                                },
                              );
                            },
                            itemCount: result.length,
                          ),
                  );
                } else if (state is SearchMoviesError) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Text('Mau cari apa nih?',
                          style: kSubtitle,
                          textAlign: TextAlign.center,
                          key: const Key('empty_message')),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
