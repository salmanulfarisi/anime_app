import 'package:anime_app/utils/const.dart';

class FireStoreServices {
  // get anime Collection
  static getAnime() {
    return firestore.collection(animeCollection).snapshots();
  }

  // get trending anime
  static getTrendingAnime() {
    return firestore
        .collection(animeCollection)
        .where('istrending', isEqualTo: true)
        .snapshots();
  }

  // get trending anime in asending order
  static getTrendingAnimeAsending() {
    return firestore
        .collection(animeCollection)
        .orderBy('trendingNo', descending: false)
        .snapshots();
  }

  // get spotlight anime
  static getSpotlightAnime() {
    return firestore
        .collection(animeCollection)
        .where('isSpotlight', isEqualTo: true)
        .snapshots();
  }

  // get charector subcollection
  static getCharector(animeId) {
    return firestore
        .collection(animeCollection)
        .doc(animeId)
        .collection(characterCollection)
        .snapshots();
  }
}
