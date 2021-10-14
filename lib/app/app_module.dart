import 'package:backstage_app/app/modules/auth/auth_module.dart';
import 'package:backstage_app/app/modules/auth/auth_store.dart';
import 'package:backstage_app/app/shared/repositories/auth/auth_repository.dart';
import 'package:backstage_app/app/shared/repositories/firestore/event_repository.dart';
import 'package:backstage_app/app/shared/repositories/firestore/music_repository.dart';
import 'package:backstage_app/app/shared/repositories/storage/local_storage_hive.dart';
import 'package:backstage_app/app/shared/repositories/storage/local_storage_interface.dart';
import 'package:backstage_app/app/shared/services/auth/auth_service.dart';
import 'package:backstage_app/app/shared/utils/components/auth_check.dart';
import 'package:backstage_app/app/shared/utils/components/initial_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => AuthService()),
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => MusicRepository()),
    Bind.lazySingleton((i) => EventRepository()),
    // Database
    Bind.lazySingleton<ILocalStorage>((i) => LocalStorageHive()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const AuthCheck()),
    ChildRoute('/initial', child: (_, args) => const InitialPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/auth', module: AuthModule()),
  ];
}
