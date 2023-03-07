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

  // get character collection
  static getCharacter() {
    return firestore
        .collection(animeCollection)
        .doc()
        .collection(characterCollection).where('')
        .snapshots();
  }
}
