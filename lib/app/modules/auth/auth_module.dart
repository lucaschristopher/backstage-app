import 'package:backstage_app/app/modules/auth/screens/login_page.dart';
import 'package:backstage_app/app/modules/auth/screens/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => const LoginPage()),
    ChildRoute('/signUp', child: (_, args) => const SignUpPage()),
  ];
}
