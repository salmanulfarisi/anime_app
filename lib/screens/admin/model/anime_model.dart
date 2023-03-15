import 'package:anime_app/screens/admin/model/actor_model.dart';
import 'package:anime_app/screens/admin/model/charactor_model.dart';

class AnimeModel {
  final String id;
  final String animeName;
  final String animeVideo;
  final List<String> animeImage;
  final List<Charactor> charactors;
  final List<Actor> actors;
  final String animeType;
  final String animeStatus;
  final double animeScore;
  final int animeRank;
  final int animePopularity;
  final String animeStrory;
  final String animeJapaneseName;
  final String animeSource;
  final String animeSeasone;
  final String animeStudio;
  final String animeRating;
  final Airing aired;
  final String animeLicensor;
  final String animeSynonyms;
  final List<Map<String, String>> producers;
  final List<Map<String, String>> externalLinks;
  final String animeInfo;
  final String animeOtherInfo;
  final Episodes episodes;
  final int trendingNo;
  final int topAiringNo;

  AnimeModel({
    required this.id,
    required this.charactors,
    required this.actors,
    required this.animeName,
    required this.animeVideo,
    required this.animeImage,
    required this.animeType,
    required this.animeStatus,
    required this.animeScore,
    required this.animeRank,
    required this.animePopularity,
    required this.animeStrory,
    required this.animeJapaneseName,
    required this.animeSource,
    required this.animeSeasone,
    required this.animeStudio,
    required this.animeRating,
    required this.aired,
    required this.animeLicensor,
    required this.animeSynonyms,
    required this.producers,
    required this.externalLinks,
    required this.animeInfo,
    required this.animeOtherInfo,
    required this.episodes,
    required this.trendingNo,
    required this.topAiringNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'animeName': animeName,
      'animeVideo': animeVideo,
      'animeImage': animeImage,
      'animeType': animeType,
      'animeStatus': animeStatus,
      'animeScore': animeScore,
      'animeRank': animeRank,
      'animePopularity': animePopularity,
      'animeStrory': animeStrory,
      'animeJapaneseName': animeJapaneseName,
      'animeSource': animeSource,
      'animeSeasone': animeSeasone,
      'animeStudio': animeStudio,
      'animeRating': animeRating,
      'animeLicensor': animeLicensor,
      "charactors": charactors.map((e) => e.toMap()).toList(),
      "actors": actors.map((e) => e.toMap()).toList(),
      'aired': aired.toMap(),
      'animeSynonyms': animeSynonyms,
      'producers': producers.map((e) => e).toList(),
      'externalLinks': externalLinks.map((e) => e).toList(),
      'animeInfo': animeInfo,
      'animeOtherInfo': animeOtherInfo,
      'episodes': episodes.toMap(),
      'trendingNo': trendingNo,
      'topAiringNo': topAiringNo,
    };
  }
}

class Episodes {
  final int currentEpisode;
  final int totalEpisodes;

  Episodes({
    required this.currentEpisode,
    required this.totalEpisodes,
  });

  factory Episodes.fromMap(Map<String, dynamic> data) {
    return Episodes(
      currentEpisode: data['currentEpisode'],
      totalEpisodes: data['totalEpisodes'],
    );
  }

  Map<String, int> toMap() {
    return {
      'currentEpisode': currentEpisode,
      'totalEpisodes': totalEpisodes,
    };
  }
}

class Airing {
  final String from;
  final String to;

  Airing({
    required this.from,
    required this.to,
  });

  factory Airing.fromMap(Map<String, dynamic> data) {
    return Airing(
      from: data['from'],
      to: data['to'],
    );
  }

  Map<String, String> toMap() {
    return {
      'from': from,
      'to': to,
    };
  }
}

class Producers {
  final String name;
  final String url;

  Producers({
    required this.name,
    required this.url,
  });

  factory Producers.fromMap(Map<String, dynamic> data) {
    return Producers(
      name: data['name'],
      url: data['url'],
    );
  }

  Map<String, String> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class ExternalLinks {
  final String name;
  final String url;

  ExternalLinks({
    required this.name,
    required this.url,
  });

  factory ExternalLinks.fromMap(Map<String, dynamic> data) {
    return ExternalLinks(
      name: data['name'],
      url: data['url'],
    );
  }

  Map<String, String> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}
