import 'package:backstage_app/app/modules/auth/auth_store.dart';
import 'package:backstage_app/app/shared/repositories/auth/auth_repository.dart';
import 'package:backstage_app/app/shared/repositories/auth/auth_repository_interface.dart';
import 'package:backstage_app/app/shared/utils/components/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final _authStore = Modular.get<AuthStore>();
  final IAuthRepository _authRepository = Modular.get<AuthRepository>();

  ReactionDisposer? disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) async {
      var value = await _authRepository.getUser();
      if (value != null && value.isNotEmpty) {
        _authStore.setUserStatus(AuthStatus.loggedIn);
      }

      if (_authStore.status == AuthStatus.loggedIn) {
        Modular.to.pushReplacementNamed('/home');
      } else {
        Modular.to.pushReplacementNamed('/initial');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CustomLoading();
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }
}
