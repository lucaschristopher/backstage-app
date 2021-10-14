import 'package:backstage_app/app/shared/repositories/auth/auth_repository_interface.dart';
import 'package:backstage_app/app/shared/repositories/storage/local_storage_hive.dart';
import 'package:backstage_app/app/shared/repositories/storage/local_storage_interface.dart';
import 'package:backstage_app/app/shared/services/auth/auth_service.dart';
import 'package:backstage_app/app/shared/utils/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository implements IAuthRepository {
  final ILocalStorage _localStorage = Modular.get<LocalStorageHive>();
  final _authService = Modular.get<AuthService>();

  @override
  Future<User?> login(String email, String password) async {
    try {
      var user = await _authService.login(email, password);
      if (user != null) {
        _localStorage.put('user', user.email);
      }
      return user;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    }
  }

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      var user = await _authService.signUp(email, password);
      if (user != null) {
        _localStorage.put('user', user.email);
      }
      return user;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    }
  }

  @override
  Future<String?> getUser() async {
    String? persistedUser = await _localStorage.get('user');
    return persistedUser;
  }

  @override
  Future<void> logout() async {
    await _localStorage.delete('user');
  }
}
