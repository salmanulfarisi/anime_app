import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

// collections
const animeCollection = 'anime';
const characterCollection = 'charactor';

// new collection
const adminAnimeCollection = 'adminAnime';

// new sub collection
const adminCharacterCollection = 'adminCharacter';
