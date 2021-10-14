import 'package:backstage_app/app/shared/repositories/auth/auth_repository.dart';
import 'package:backstage_app/app/shared/repositories/auth/auth_repository_interface.dart';
import 'package:backstage_app/app/shared/utils/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository _authRepository = Modular.get<AuthRepository>();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  User? user;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setUser(User? newUser) {
    user = newUser;
    status = user == null ? AuthStatus.notLoggedIn : AuthStatus.loggedIn;
  }

  @action
  void setUserStatus(AuthStatus value) {
    status = value;
  }

  Future<void>? login(String email, String password) async {
    setLoading(true);
    try {
      var user = await _authRepository.login(email, password);
      if (user != null) {
        setUser(user);
        Modular.to.navigate('/home');
      }
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } finally {
      setLoading(false);
    }
  }

  Future<void>? signUp(String email, String password) async {
    setLoading(true);
    try {
      var user = await _authRepository.signUp(email, password);
      if (user != null) {
        setUser(user);
        Modular.to.navigate('/home');
      }
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } finally {
      setLoading(false);
    }
  }
}

enum AuthStatus { loading, loggedIn, notLoggedIn }
