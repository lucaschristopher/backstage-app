import 'package:backstage_app/app/shared/models/event.dart';
import 'package:backstage_app/app/shared/models/music.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int currentPage = 0;

  @observable
  List<Music>? playlist = [];

  @observable
  List<Event>? events = [];

  @action
  void setCurrentPage(int newPage) {
    currentPage = newPage;
  }

  @action
  void setPlaylist(List<Music>? newList) {
    playlist = newList;
  }

  @action
  void setEventList(List<Event>? newList) {
    events = newList;
  }
}
