import 'package:backstage_app/app/shared/databases/db_firestore.dart';
import 'package:backstage_app/app/shared/models/music.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MusicRepository {
  List<Music> playlist = [];
  late FirebaseFirestore database;

  MusicRepository() {
    _startRepository();
  }

  void _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    database = DBFirestore.get();
  }

  void loadPlaylist() async {
    try {
      final snapshot = await database.collection('/musics').get();
      for (var doc in snapshot.docs) {
        var music = Music(
          cipher: doc.get('cipher'),
          link: doc.get('link'),
          name: doc.get('name'),
          songwriter: doc.get('songwriter'),
        );
        playlist.add(music);
      }
    } catch (error) {}
  }
}
