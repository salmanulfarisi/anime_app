import 'package:anime_app/screens/admin/model/anime_model.dart';
import 'package:anime_app/screens/admin/model/charactor_model.dart';
import 'package:anime_app/utils/const.dart';
import 'package:velocity_x/velocity_x.dart';

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

  // add sub collection to admin anime collection
  static addSubCollectionToAdminAnimeCollection(
      String animeId, Charactor charactorData) {
    firestore
        .collection(adminAnimeCollection)
        .doc(animeId)
        .collection(adminCharacterCollection)
        .add(charactorData.toMap());
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

  // get topAiring anime details from admin anime collection in asending order while topAiring no gretter than 0
  static getTopAiringAnimeDetailsAsending() {
    return firestore
        .collection(adminAnimeCollection)
        .where('topAiringNo', isGreaterThan: 0)
        .orderBy('topAiringNo', descending: false)
        .snapshots();
  }

  static getNewDocumentId() {
    return firestore.collection(adminAnimeCollection).doc().id;
  }

  // get new document id for character
  static getNewDocumentIdForCharacter(animeId) {
    return firestore
        .collection(adminAnimeCollection)
        .doc(animeId)
        .collection(characterCollection)
        .doc()
        .id;
  }

  // update anime details
  static updateAnimeDetails(AnimeModel animeData) {
    firestore
        .collection(adminAnimeCollection)
        .doc(animeData.id)
        .update(animeData.toMap());
  }

  // getAnime Name by id
  static getAnimeNameById(context, animeId) {
    return firestore
        .collection(adminAnimeCollection)
        .where('id', isEqualTo: animeId)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return VxToast.show(context, msg: "${value.docs[0]['animeName']}");
      } else {
        return VxToast.show(context, msg: 'Anime not found');
      }
    });
  }
}
