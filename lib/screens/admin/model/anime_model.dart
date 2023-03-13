class AnimeModel {
  final String id;
  final String animeName;
  final List<String> animeImage;
  final String animeType;
  final String animeStatus;
  final double animeScore;
  final int animeRank;
  final String animePopularity;
  final String animeStrory;
  final String animeJapaneseName;
  final String animeSource;
  final String animeSeasone;
  final String animeStudio;
  final String animeRating;
  final Airing aired;
  final String animeLicensor;
  final String animeSynonyms;
  final Producers producers;
  final ExternalLinks externalLinks;
  final String animeInfo;
  final String animeOtherInfo;
  final int trendingNo;
  final int topAiringNo;

  AnimeModel({
    required this.id,
    required this.animeName,
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
    required this.trendingNo,
    required this.topAiringNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'animeName': animeName,
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
      'aired': aired.toMap(),
      'animeSynonyms': animeSynonyms,
      'producers': producers.toMap(),
      'externalLinks': externalLinks.toMap(),
      'animeInfo': animeInfo,
      'animeOtherInfo': animeOtherInfo,
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
