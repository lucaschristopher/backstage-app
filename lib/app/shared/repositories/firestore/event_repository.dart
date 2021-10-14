import 'package:backstage_app/app/shared/databases/db_firestore.dart';
import 'package:backstage_app/app/shared/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventRepository {
  late FirebaseFirestore database;

  EventRepository() {
    _startRepository();
  }

  void _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    database = DBFirestore.get();
  }

  Future<List<Event>?> loadEvents() async {
    List<Event> events = [];

    try {
      final snapshot = await database.collection('/events').get();
      for (var doc in snapshot.docs) {
        var event = Event(
          date: doc.get('date'),
          name: doc.get('name'),
          schedule: doc.get('schedule'),
          tagColor: doc.get('tagColor'),
        );
        events.add(event);
      }
      return events;
    } catch (error) {}
  }
}
