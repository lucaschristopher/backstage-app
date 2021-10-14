import 'package:backstage_app/app/modules/home/home_store.dart';
import 'package:backstage_app/app/shared/models/event.dart';
import 'package:backstage_app/app/shared/repositories/firestore/event_repository.dart';
import 'package:backstage_app/app/shared/utils/constants/app_colors.dart';
import 'package:backstage_app/app/shared/utils/constants/font_sizes.dart';
import 'package:backstage_app/app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late List<Event>? events;
  final store = Modular.get<HomeStore>();
  final _eventRepository = Modular.get<EventRepository>();

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() async {
    List<Event>? events = await _eventRepository.loadEvents();
    store.setEventList(events);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            const Text(
              "asasasajsiajsias",
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: store.events!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: 8.0,
                      ),
                      // Card
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.unselectedItemColor,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 26.0,
                                right: 24.0,
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                width: MediaQuery.of(context).size.width * 0.11,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Utils.getColorFromHex(
                                    store.events![index].tagColor,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    Utils.formatDateToCardEvent(
                                      store.events![index].date,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: FontSize.medium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  store.events![index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: FontSize.medium,
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Text(
                                  store.events![index].schedule,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSize.normal,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
