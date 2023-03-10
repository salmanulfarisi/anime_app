import 'package:anime_app/models/actors_model.dart';
import 'package:anime_app/models/charactor_actor_model.dart';
import 'package:anime_app/models/charactor_model.dart';

class AnimeModel {
  final List<String> animeImg;
  final String animeName;
  final List<Actors> actors;
  final Airing aired;
  final List<CharactorActorModel> charactorActor;
  final List<CharactorModel> charactors;
  final String id;
  final String japaneseName;
  final String overview;
  final int popularity;
  final String producers;
  final int rank;
  final String rating;
  final double score;
  final String status;
  final String studio;
  final String type;
  final String synonyms;
  final String totalEpisodes;

  AnimeModel({
    required this.animeImg,
    required this.animeName,
    required this.actors,
    required this.aired,
    required this.charactorActor,
    required this.charactors,
    required this.id,
    required this.japaneseName,
    required this.overview,
    required this.popularity,
    required this.producers,
    required this.rank,
    required this.rating,
    required this.score,
    required this.status,
    required this.studio,
    required this.type,
    required this.synonyms,
    required this.totalEpisodes,
  });

  factory AnimeModel.fromMap(Map<String, dynamic> data) {
    return AnimeModel(
      animeImg: List<String>.from(data['animeImg'].map((x) => x)),
      animeName: data['animeName'],
      actors: List<Actors>.from(data['actors'].map((x) => Actors.fromMap(x))),
      aired: Airing.fromMap(data['aired']),
      charactorActor: List<CharactorActorModel>.from(
          data['charactorActor'].map((x) => CharactorActorModel.fromMap(x))),
      charactors: List<CharactorModel>.from(
          data['charactors'].map((x) => CharactorModel.fromMap(x))),
      id: data['id'],
      japaneseName: data['japaneseName'],
      overview: data['overview'],
      popularity: data['popularity'],
      producers: data['producers'],
      rank: data['rank'],
      rating: data['rating'],
      score: data['score'],
      status: data['status'],
      studio: data['studio'],
      type: data['type'],
      synonyms: data['synonyms'],
      totalEpisodes: data['totalEpisodes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'animeImg': List<dynamic>.from(animeImg.map((x) => x)),
      'animeName': animeName,
      'actors': List<dynamic>.from(actors.map((x) => x.toMap())),
      'aired': aired.toMap(),
      'charactorActor':
          List<dynamic>.from(charactorActor.map((x) => x.toMap())),
      'charactors': List<dynamic>.from(charactors.map((x) => x.toMap())),
      'id': id,
      'japaneseName': japaneseName,
      'overview': overview,
      'popularity': popularity,
      'producers': producers,
      'rank': rank,
      'rating': rating,
      'score': score,
      'status': status,
      'studio': studio,
      'type': type,
      'synonyms': synonyms,
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
