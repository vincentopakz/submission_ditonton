import 'dart:convert';
import 'package:http/io_client.dart';

import 'package:core/core.dart';
import 'package:television/television.dart';

abstract class TVRemoteDataSource {
  Future<List<TVModel>> getTVOnTheAir();
  Future<TvDetailResponse> getTVDetail(int id);
  Future<List<TVModel>> getPopularTVShows();
  Future<List<TVModel>> getTopRatedTVShows();
  Future<List<TVModel>> getTvRecommendations(int id);
  Future<List<TVModel>> searchTVShows(String query);
}

class TVRemoteDataSourceImpl implements TVRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final IOClient client;

  TVRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TVModel>> getTVOnTheAir() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(jsonDecode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailResponse> getTVDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> getPopularTVShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(jsonDecode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> getTopRatedTVShows() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(jsonDecode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> getTvRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(jsonDecode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVModel>> searchTVShows(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(jsonDecode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }
}
