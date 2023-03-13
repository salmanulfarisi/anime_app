import 'package:anime_app/screens/admin/model/anime_model.dart';
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

  // get Top airing anime in asending order
  static getTopAiringAnimeAsending() {
    return firestore
        .collection(animeCollection)
        .orderBy('topAiringNo', descending: false)
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

  // // add anime
  // static addAnime(AnimeModel animeData) {
  //   firestore.collection(animeCollection).add(animeData.toMap());
  // }

  // // update content is same id anime
  // static updateAnime(AnimeModel animeData) {
  //   firestore
  //       .collection(animeCollection)
  //       .doc(animeData.id)
  //       .update(animeData.toMap());
  // }

  // add anime details to admin anime collection
  static addAnimeDetails(AnimeModel animeData) {
    firestore.collection(adminAnimeCollection).add(animeData.toMap());
  }

  // get anime details from admin anime collection
  static getAnimeDetails() {
    return firestore.collection(adminAnimeCollection).snapshots();
  }

  // get trending anime details from admin anime collection in asending order while trending no gretter than 0
  static getTrendingAnimeDetailsAsending() {
    return firestore
        .collection(adminAnimeCollection)
        .where('trendingNo', isGreaterThan: 0)
        .orderBy('trendingNo', descending: false)
        .snapshots();
  }

  // get new document id
  static getNewDocumentId() {
    return firestore.collection(adminAnimeCollection).doc().id;
  }
}
