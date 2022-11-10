import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:submission_ditonton/injection.dart' as di;

import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:movies/movies.dart';
import 'package:search/search.dart';
import 'package:television/television.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<MovieNowPlayingBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MoviePopularBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieRecommendationBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieTopRatedBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieWatchlistBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvListBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvPopularBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvRecommendationBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvTopRatedBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvWatchlistBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<SearchTvBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
        ),
        home: const MovieHomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case movieRoute:
              return CupertinoPageRoute(builder: (_) => const MovieHomePage());
            case popularmovieRoute:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case topRatedmovieRoute:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case movieDetailRoute:
              final id = settings.arguments as int;
              return CupertinoPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case searchMovieRoute:
              return CupertinoPageRoute(
                  builder: (_) => const SearchMoviePage());
            case searchTVRoute:
              return CupertinoPageRoute(
                  builder: (_) => const SearchTelevisionPage());
            case watchlistmovieRoute:
              return CupertinoPageRoute(
                  builder: (_) => const WatchlistMoviesPage());
            case watchlistTVRoute:
              return CupertinoPageRoute(
                  builder: (_) => const WatchlistTVPage());
            case aboutRoute:
              return CupertinoPageRoute(builder: (_) => const AboutPage());
            case tvRoute:
              return CupertinoPageRoute(
                builder: (context) => const TVHomePage(),
              );
            case popularTVRoute:
              return CupertinoPageRoute(
                builder: (_) => const PopularTVPage(),
              );
            case topRatedTVRoute:
              return CupertinoPageRoute(
                builder: (context) => const TopRatedTVPage(),
              );
            case tvDetailRoute:
              final id = settings.arguments as int;
              return CupertinoPageRoute(
                builder: (_) => TVDetailPage(id: id),
                settings: settings,
              );
            default:
              return CupertinoPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
