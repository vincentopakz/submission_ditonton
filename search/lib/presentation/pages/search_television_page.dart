import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:search/search.dart';
import 'package:television/television.dart';

class SearchTelevisionPage extends StatelessWidget {
  const SearchTelevisionPage({
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
              key: const Key('tv_text_field'),
              onChanged: (query) {
                context.read<SearchTvBloc>().add(OnQueryTvChange(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search TV Show Title',
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
            BlocBuilder<SearchTvBloc, SearchTvState>(
              builder: (context, state) {
                if (state is SearchTvLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchTvHasData) {
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
                              final tv = result[index];
                              return TVShowCard(
                                key: Key('tv_card_$index'),
                                tv: tv,
                                isWatchlist: false,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    tvDetailRoute,
                                    arguments: tv.id,
                                  );
                                },
                              );
                            },
                            itemCount: result.length,
                          ),
                  );
                } else if (state is SearchTvError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Mau cari apa nih?',
                        style: kSubtitle,
                        textAlign: TextAlign.center,
                        key: const Key('empty_message'),
                      ),
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
